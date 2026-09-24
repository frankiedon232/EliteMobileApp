$(document).ready(function () {
  // START API CALLS ///////////////////////////////////////////////////////////////////
  var getATmOFInterestUrl =
    "https://elitesolution.providusbank.com/app_api/atmofinterest.php";
  var getReportingUrl =
    "https://elitesolution.providusbank.com/app_api/atmreporting.php";
  var getPerfTerm =
    "https://elitesolution.providusbank.com/app_api/termLookup.php";
  var singleView =
    "https://elitesolution.providusbank.com/app_api/fetchSingleTerm.php";
  var perReportURL =
    "https://elitesolution.providusbank.com/app_api/perfReportQuery.php";
  var prefDefaultURL =
    "https://elitesolution.providusbank.com/app_api/performanceRealTime.php";
  var backedOutTerms =
    "https://elitesolution.providusbank.com/app_api/backedOutTerms.php";
  // START API CALLS ///////////////////////////////////////////////////////////////////

  $("#show_performance").hide();
  $("#toggleOverlay").hide();
  $("#showNewFIlter").hide();

  $("#load-reporting").change(function () {
    var filter = $(this).val();
    localStorage["filter_rpt"] = filter;
    window.location.reload();
  });

  if (localStorage["filter_rpt"]) {
    localStorage["filter_report"] = localStorage["filter_rpt"];
    $("#mode-load").html(localStorage["filter_report"]);

    $(".show-mode").val(localStorage["filter_report"]);
    // // console.log("Main Report Filtetring is: " + localStorage['filter_report']);
  } else {
    localStorage["filter_report"] = "All";
    $("#mode-load").html(localStorage["filter_report"]);

    $(".show-mode").val(localStorage["filter_report"]);
    // // console.log("Default Report Filtetring is: " + localStorage['filter_report']);
  }

  accessData = {
    access_region: localStorage["dashbaccregion"],
    access_state: localStorage["access_states"],
    access_atms: localStorage["access_atms"],
    total_count: localStorage["totalCount"],
  };

  accessDataReporting = {
    access_region: localStorage["dashbaccregion"],
    access_state: localStorage["access_states"],
    access_atms: localStorage["access_atms"],
    total_count: localStorage["totalCount"],
    filter_report: localStorage["filter_report"],
  };

  $.fn.dataTable.ext.classes.sPageButton = "btn btn-sm btn-primary add-space";
  $.fn.DataTable.ext.pager.numbers_length = 4;
  $.fn.dataTable.ext.errMode = function (settings, helpPage, message) {
    // // console.log(message);
  };

  // START ATM of interest ////////////////////////////////////////////////////
  var table = $(".datatable-int").DataTable({
    responsive: true,
    lengthChange: false,
    dom: "lrtip",
    pagingType: "simple",
    processing: true,
    language: {
      paginate: {
        next: '<span class="material-icons">navigate_next</span>',
        previous: '<span class="material-icons">navigate_before</span>',
      },
      lengthMenu: "Display _MENU_ records per page",
      zeroRecords: "No records available",
      serverSide: true,
    },
    ajax: {
      url: getATmOFInterestUrl,
      type: "POST",
      data: accessData,
    },
    columns: [
      { data: "terminal_id" },
      { data: "location" },
      { data: "status" },
      {
        data: "amount",
        render: function (data, type, row, meta) {
          var amount = (data / 100).toFixed() * 100;
          return amount.toLocaleString() + ".00";
        },
      },
      { data: "type" },
      { data: "brand" },
      { data: "state" },
      { data: "region" },
      {
        data: "last_txn_date",
        render: function (d, type, full) {
          var dt = new Date(d);
          datefmt = `${dt.getDate().toString().padStart(2, "0")}/${(
            dt.getMonth() + 1
          )
            .toString()
            .padStart(2, "0")}/${dt
            .getFullYear()
            .toString()
            .padStart(4, "0")} ${dt.getHours().toString().padStart(2, "0")}:${dt
            .getMinutes()
            .toString()
            .padStart(2, "0")}`;

          // // console.log(datefmt);
          return datefmt;
        },
      },
      { data: "card_reader" },
      { data: "cash_jam" },
    ],
    createdRow: function (row, data, index) {
      if (data["status"] === "OFFLINE") {
        $("td", row).eq(2).css({ color: "red", "font-weight": "600" });
      }
      if (data["status"] === "ACTIVE") {
        $("td", row).eq(2).css({ color: "green", "font-weight": "600" });
      }
      if (data["status"] === "SUPERVISOR") {
        $("td", row).eq(2).css({ color: "purple", "font-weight": "600" });
      }
      if (data["status"] === "CLOSE") {
        $("td", row).eq(2).css({ color: "tomato", "font-weight": "600" });
      }
      if (data["last_txn_date"] !== "") {
        $("td", row).eq(8).css({ color: "black", "font-weight": "600" });
      }
      if (data["amount"] !== "") {
        $("td", row).eq(3).css({ color: "black", "font-weight": "600" });
      }
    },
    initComplete: function (settings, json) {
      $("#toggleOverlay").hide();
    },
  });
  $("#searchFilter").on("keyup", function () {
    table.search(this.value).draw();
  });
  // END ATM of interest ////////////////////////////////////////////////////

  // START Reporting data ////////////////////////////////////////////////////
  var tableDefault = $(".datatable-default").DataTable({
    responsive: true,
    lengthChange: false,
    dom: "lrtip",
    pagingType: "simple",
    processing: true,
    language: {
      paginate: {
        next: '<span class="material-icons">navigate_next</span>',
        previous: '<span class="material-icons">navigate_before</span>',
      },
      lengthMenu: "Display _MENU_ records per page",
      zeroRecords: "No records available",
      serverSide: true,
    },
    ajax: {
      url: getReportingUrl,
      type: "POST",
      data: accessDataReporting,
    },
    columns: [
      { data: "terminal_id" },
      { data: "location" },
      { data: "status" },
      {
        data: "amount",
        render: function (data, type, row, meta) {
          var amount = (data / 100).toFixed() * 100;
          return amount.toLocaleString() + ".00";
        },
      },
      { data: "type" },
      { data: "brand" },
      { data: "state" },
      { data: "region" },
      {
        data: "last_txn_date",
        render: function (d, type, full) {
          var dt = new Date(d);
          datefmt = `${dt.getDate().toString().padStart(2, "0")}/${(
            dt.getMonth() + 1
          )
            .toString()
            .padStart(2, "0")}/${dt
            .getFullYear()
            .toString()
            .padStart(4, "0")} ${dt.getHours().toString().padStart(2, "0")}:${dt
            .getMinutes()
            .toString()
            .padStart(2, "0")}`;

          //// // console.log(datefmt);
          return datefmt;
        },
      },
      { data: "card_reader" },
      { data: "cash_jam" },
    ],
    createdRow: function (row, data, index) {
      if (data["status"] === "OFFLINE") {
        $("td", row).eq(2).css({ color: "red", "font-weight": "600" });
      }
      if (data["status"] === "ACTIVE") {
        $("td", row).eq(2).css({ color: "green", "font-weight": "600" });
      }
      if (data["status"] === "SUPERVISOR") {
        $("td", row).eq(2).css({ color: "purple", "font-weight": "600" });
      }
      if (data["status"] === "CLOSE") {
        $("td", row).eq(2).css({ color: "tomato", "font-weight": "600" });
      }
      if (data["last_txn_date"] !== "") {
        $("td", row).eq(8).css({ color: "black", "font-weight": "600" });
      }
      if (data["amount"] !== "") {
        $("td", row).eq(3).css({ color: "black", "font-weight": "600" });
      }
    },
    drawCallback: function (settings, start, end, max, total, pre) {
      var found_total = this.fnSettings().fnRecordsTotal();
      // // console.log(found_total);
      $("#load_found").html(found_total);
    },
    initComplete: function (settings, json) {
      $("#toggleOverlay").hide();
    },
  });

  $("#searchFilter-default").on("keyup", function () {
    tableDefault.search(this.value).draw();
  });
  // END Reporting data ////////////////////////////////////////////////////

  // START: FIlter Terminal Lookup ///////////////////////////////////////////////////
  $("#lookUpTerminal").on("click", function () {
    $("#toggleOverlay").show();
    var terminal_id = $("#terminal_id").val();
    if (terminal_id != "") {
      var data = {
        terminal_id: terminal_id,
      };
      // Performance query
      $.ajax({
        type: "POST",
        url: getPerfTerm,
        data: data,
        success: function (response) {
          //console.log("PERFORMANCE INFORMATION");
          //console.log(response);

          var cashJamPCT = response.cashJamPCT;
          var closePCT = response.closePCT;
          var offlinePCT = response.offlinePCT;
          var totalPCTDT = response.totalPCTDT;
          var uptimePCT = response.uptimePCT;

          $("#cashJamPCT").html(cashJamPCT);
          $("#closePCT").html(closePCT);
          $("#offlinePCT").html(offlinePCT);
          $("#totalPCTDT").html(totalPCTDT);
          $("#uptimePCT").html(uptimePCT);
        },
      });

      // Single ATM query
      $.ajax({
        type: "POST",
        url: singleView,
        data: data,
        success: function (respnd) {
          var rsp = $.trim(respnd);
          if (rsp != "not found") {
            //console.log("SINGLE ATM INFORMATION");
            //console.log(respnd);

            var brand = respnd.brand;
            var last_txn_date = respnd.last_txn_date;
            var location = respnd.location;
            var region = respnd.region;
            var state = respnd.state;
            var status = respnd.status;
            var terminal_id = respnd.terminal_id;

            if (status == "ACTIVE") {
              var dataStatus = `<b class="text-success">${status}</b>`;
            }
            if (status == "OFFLINE") {
              var dataStatus = `<b class="text-danger">${status}</b>`;
            }
            if (status == "CLOSE") {
              var dataStatus = `<b class="text-warning">${status}</b>`;
            }
            if (status == "SUPERVISOR") {
              var dataStatus = `<b class="text-warning">${status}</b>`;
            }

            var today = getDate();

            $("#brand").html(brand);
            $("#last_txn_date").html(last_txn_date);
            $("#location").html(location);
            $("#region").html(region);
            $("#state").html(state);
            $("#status").html(dataStatus);
            $("#show_term_id").html(terminal_id);
            $("#show_per_date").html(today);

            $("#show_search").hide();
            $("#show_performance").show(1000);
            $("#toggleOverlay").hide();
          } else {
            $("#toggleOverlay").hide();
            swal({
              title: "Not Found",
              text: "Terminal not found. Please check the terminal and try again",
              icon: "error",
              closeOnClickOutside: false,
            });
          }
        },
      });
    } else {
      $("#toggleOverlay").hide();
      swal({
        title: "Empty Input",
        text: "Terminal ID is required for lookup query",
        icon: "error",
        closeOnClickOutside: false,
      });
    }
  });
  // END: FIlter Terminal Lookup /////////////////////////////////////////////////////

  // START: FIlter Terminal Lookup ///////////////////////////////////////////////////
  $("#perfReportSerch").on("click", function () {
    $("#toggleOverlay").show();

    var between_date = $("#between_date").val();
    var and_date = $("#and_date").val();
    var terminal_id = $("#terminal_id").val();

    if (terminal_id != "") {
      var data = {
        between_date: between_date,
        and_date: and_date,
        terminal_id: terminal_id,
      };

      // console.log(data);

      $("#showBetweet").html(between_date);
      $("#showAnd").html(and_date);
      $("#showSerchTerm").html(terminal_id);

      // START Reporting data ////////////////////////////////////////////////////
      $(".datatable-perfrpt").DataTable({
        responsive: true,
        lengthChange: false,
        dom: "lrtip",
        pagingType: "simple",
        processing: true,
        language: {
          paginate: {
            next: '<span class="material-icons">navigate_next</span>',
            previous: '<span class="material-icons">navigate_before</span>',
          },
          lengthMenu: "Display _MENU_ records per page",
          zeroRecords: "No records available",
          serverSide: true,
        },
        ajax: {
          url: perReportURL,
          type: "POST",
          data: data,
        },
        columns: [
          { data: "terminal" },
          { data: "uptimePCT" },
          { data: "totalPCTDT" },
          { data: "offlinePCT" },
          { data: "closePCT" },
          { data: "cashJamPCT" },
          { data: "location" },
          { data: "sol_id" },
          { data: "periods" },
        ],
        drawCallback: function (settings, start, end, max, total, pre) {
          var found_total = this.fnSettings().fnRecordsTotal();
          // // console.log(found_total);
          $("#load_found").html(found_total + " Records");
        },
        initComplete: function (settings, json) {
          $("#toggleOverlay").hide();
          $("#show_performance").show();
          $("#toggleFormFIlter").hide(1000);
          $("#showNewFIlter").show();
          $("#show_search").hide();

          $("#showNew")
            .html(`<a href="javascript:;" onclick="return initload(page='perfreport.html');" id="perfreport.html" class="text-primary">
                    <u>New <i class="material-icons">add_box</i></u>
                </a>`);
        },
      });
      // END Reporting data ////////////////////////////////////////////////////
    } else {
      $("#toggleOverlay").hide();
      swal({
        title: "Empty Input",
        text: "Terminal ID is required for lookup query",
        icon: "error",
        closeOnClickOutside: false,
      });
    }
  });
  // END: FIlter Terminal Lookup /////////////////////////////////////////////////////

  // START Performance Report data ////////////////////////////////////////////////////
  var perTableDef = $(".datatable-perfrptdef").DataTable({
    responsive: true,
    lengthChange: false,
    dom: "lrtip",
    pagingType: "simple",
    processing: true,
    language: {
      paginate: {
        next: '<span class="material-icons">navigate_next</span>',
        previous: '<span class="material-icons">navigate_before</span>',
      },
      lengthMenu: "Display _MENU_ records per page",
      zeroRecords: "No records available",
      serverSide: true,
    },
    ajax: {
      url: prefDefaultURL,
      type: "POST",
      data: accessDataReporting,
    },
    columns: [
      { data: "terminal" },
      { data: "uptimePCT" },
      { data: "totalPCTDT" },
      { data: "offlinePCT" },
      { data: "closePCT" },
      { data: "cashJamPCT" },
      { data: "location" },
      { data: "sol_id" },
      { data: "periods" },
    ],
    drawCallback: function (settings, start, end, max, total, pre) {
      var found_total = this.fnSettings().fnRecordsTotal();
      // // console.log(found_total);
      $("#load_found").html(found_total + " Records");
    },
    initComplete: function (settings, json) {
      $("#toggleOverlay").hide();
    },
  });

  $("#searchFilter-perfrptdef").on("keyup", function () {
    perTableDef.search(this.value).draw();
  });
  // END Performance report data ///////////////////////////////////////////////////////

  // START backed out terminals ////////////////////////////////////////////////////
  var backedOut = $(".datatable-backedout").DataTable({
    responsive: true,
    lengthChange: false,
    dom: "lrtip",
    pagingType: "simple",
    processing: true,
    language: {
      paginate: {
        next: '<span class="material-icons">navigate_next</span>',
        previous: '<span class="material-icons">navigate_before</span>',
      },
      lengthMenu: "Display _MENU_ records per page",
      zeroRecords: "No records available",
      serverSide: true,
    },
    ajax: {
      url: backedOutTerms,
      type: "POST",
      data: accessDataReporting,
    },
    columns: [
      { data: "terminal_id" },
      { data: "location" },
      { data: "status" },
      { data: "brand" },
      { data: "state" },
      { data: "region" },
      {
        data: "last_txn_date",
        render: function (d, type, full) {
          var dt = new Date(d);
          datefmt = `${dt.getDate().toString().padStart(2, "0")}/${(
            dt.getMonth() + 1
          )
            .toString()
            .padStart(2, "0")}/${dt
            .getFullYear()
            .toString()
            .padStart(4, "0")} ${dt.getHours().toString().padStart(2, "0")}:${dt
            .getMinutes()
            .toString()
            .padStart(2, "0")}`;

          //// // console.log(datefmt);
          return datefmt;
        },
      },
      { data: "duration" },
    ],
    createdRow: function (row, data, index) {
      if (data["status"] === "OFFLINE") {
        $("td", row).eq(2).css({ color: "red", "font-weight": "600" });
      }
      if (data["status"] === "ACTIVE") {
        $("td", row).eq(2).css({ color: "green", "font-weight": "600" });
      }
      if (data["status"] === "SUPERVISOR") {
        $("td", row).eq(2).css({ color: "purple", "font-weight": "600" });
      }
      if (data["status"] === "CLOSE") {
        $("td", row).eq(2).css({ color: "tomato", "font-weight": "600" });
      }
      if (data["last_txn_date"] !== "") {
        $("td", row).eq(8).css({ color: "black", "font-weight": "600" });
      }
    },
    drawCallback: function (settings, start, end, max, total, pre) {
      var found_total = this.fnSettings().fnRecordsTotal();
      // // console.log(found_total);
      $("#load_found").html(found_total);
    },
    initComplete: function (settings, json) {
      $("#toggleOverlay").hide();
    },
  });

  $("#searchFilter-backedout").on("keyup", function () {
    backedOut.search(this.value).draw();
  });
  // END backed out terminals ////////////////////////////////////////////////////
});

function getDate() {
  let date_ob = new Date();
  let date = ("0" + date_ob.getDate()).slice(-2);
  let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  let year = date_ob.getFullYear();
  let hours = date_ob.getHours();
  let minutes = date_ob.getMinutes();
  let seconds = date_ob.getSeconds();
  return date + "/" + month + "/" + year + " " + hours + ":" + minutes;
}

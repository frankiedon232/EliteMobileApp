//START API Calls //////////////////////////////////////////////////////////////////////
var logInUserUrl = "https://elitesolution.providusbank.com/app_api/login.php";
var getCountUrl = "https://elitesolution.providusbank.com/app_api/getcount.php";
var addToAuditUrl =
  "https://elitesolution.providusbank.com/app_api/addaudit.php";
var getInserviceUrl =
  "https://elitesolution.providusbank.com/app_api/getInservice.php";
var getOfflineUrl =
  "https://elitesolution.providusbank.com/app_api/getOffline.php";
var getClosedUrl =
  "https://elitesolution.providusbank.com/app_api/getClosed.php";
var getSuperUrl =
  "https://elitesolution.providusbank.com/app_api/getSupervisor.php";
var getcashJamUrl =
  "https://elitesolution.providusbank.com/app_api/getCashjam.php";
var getNoCashUrl =
  "https://elitesolution.providusbank.com/app_api/getNocash.php";
var getLowCashUrl =
  "https://elitesolution.providusbank.com/app_api/getLowcash.php";
var getModerateCashUrl =
  "https://elitesolution.providusbank.com/app_api/getModeratecash.php";
var getHighCashUrl =
  "https://elitesolution.providusbank.com/app_api/getHighcash.php";
var getATmOFInterestUrl =
  "https://elitesolution.providusbank.com/app_api/atmofinterest.php";
var getRegionsUrl =
  "https://elitesolution.providusbank.com/app_api/getRegions.php";
var getReportingUrl =
  "https://elitesolution.providusbank.com/app_api/getReportingpages.php";
var getCountUrlFIlter =
  "https://elitesolution.providusbank.com/app_api/countFilter.php";
var getPerfCOunt =
  "https://elitesolution.providusbank.com/app_api/getavailabilitycount.php";
//END API Calls ////////////////////////////////////////////////////////////////////////

// BEGIN - User login check ////////////////////
function is_logged_in() {
  if (localStorage["email"] && localStorage["email"] != null) {
    // console.log("You are Looged in"); // do nothing here
  } else {
    // Redirect user to login if not
    window.open("login.html", "_self");
    // console.log("You are Noy Looged in"); // do nothing here
  }
}

function check_visited_logged() {
  if (localStorage["email"]) {
    window.open("home.html", "_self");
  }
}

function introPage() {
  if (localStorage["vst"] && localStorage["vst"] != null) {
    // Check if logged in here and redirect to home
    if (localStorage["email"] && localStorage["email"] != null) {
      window.open("home.html", "_self");
    } else {
      // Redirect user to login if not
      window.open("login.html", "_self");
    }
  } else {
    // console.log("First time visit");
  }
}
// BEGIN - User login check ////////////////////

// START: login user /////////////////////////////////////////////
function login() {
  $(".loader").show();
  $(".btn-block").attr("disabled", true);

  var username = document.getElementById("username").value;
  var userpass = document.getElementById("userpass").value;
  if (username != "" && username != "") {
    var data = {
      username: username,
      userpass: userpass,
    };

    // begin ajex call here
    $.ajax({
      type: "POST",
      url: logInUserUrl,
      data: data,
      success: function (response) {
        var rsp = $.trim(response);
        // console.log(rsp);
        switch (rsp) {
          case "Not Approved":
            swal({
              title: "Not Approved !",
              text: "Account Not Approved",
              icon: "error",
              closeOnClickOutside: false,
            });
            $(".btn-block").attr("disabled", false);
            $(".loader").hide();
            break;
          case "Account Locked":
            swal({
              title: "Account Locked !",
              text: "Your Account Locked",
              icon: "error",
              closeOnClickOutside: false,
            });
            $(".btn-block").attr("disabled", false);
            $(".loader").hide();
            break;
          case "Invalid Credentials":
            swal({
              title: "Invalid Credentials",
              text: "Invalid Login Credentials",
              icon: "error",
              closeOnClickOutside: false,
            });
            $(".btn-block").attr("disabled", false);
            $(".loader").hide();
            break;
          case "Account Not Created":
            // console.log("Account Not Created");
            break;
          default:
            var userInfo = JSON.parse(rsp);
            // console.log(userInfo);
            var id = userInfo.id;
            var uname = userInfo.uname;
            var email = userInfo.email;
            var phone = userInfo.phone;
            var files = userInfo.files;
            var role = userInfo.role;
            var dashbaccregion = userInfo.dashbaccregion;
            var access_states = userInfo.access_states;
            var access_atms = userInfo.access_atms;

            localStorage["id"] = id;
            localStorage["uname"] = uname;
            localStorage["email"] = email;
            localStorage["phone"] = phone;
            localStorage["files"] = files;
            localStorage["role"] = role;
            localStorage["dashbaccregion"] = dashbaccregion;
            localStorage["access_states"] = access_states;
            localStorage["access_atms"] = access_atms;

            localStorage["vst"] = true;

            window.open("home.html", "_self");
            $(".btn-block").attr("disabled", false);
            $(".loader").hide();
        }
      },
    });
  } else {
    swal({
      title: "Oops !",
      text: "Invalid entry. Input can not be blank",
      icon: "error",
      closeOnClickOutside: false,
    });
    $(".btn-block").attr("disabled", false);
    $(".loader").hide();
  }
}
// END: login user ///////////////////////////////////////////////////////////////////

// START: Reload based on selected region and run access
$("#load-regions").change(function () {
  var region = $(this).val();
  $.ajax({
    type: "POST",
    url: getCountUrlFIlter,
    data: { region: region },
    success: function (response) {
      var rsp = $.trim(response);
      localStorage["totalCount"] = rsp;
      localStorage["dashbaccregion"] = region;
      localStorage["curr_region"] = region;

      window.location.reload();
    },
  });
});

$("#load-regions-crad").change(function () {
  var region = $(this).val();
  localStorage["card_region"] = region;
  window.location.reload();
});

$(".rgn").html(localStorage["curr_region"]);

// localStorage['dashbaccregion'] = "All";

// END Reload based on selected region and run access

// START: User logged in specifuc script execution ///////////////////////////////////
if (localStorage["email"] && localStorage["phone"] && localStorage["uname"]) {
  //START: Show basic information
  $(".username").html(localStorage["uname"]);
  $(".show_sub_info").html("Providus bank");
  //END: Show basic information

  // START: Get total count ////////////////
  accessData = {
    access_region: localStorage["dashbaccregion"],
    access_state: localStorage["access_states"],
    access_atms: localStorage["access_atms"],
    total_count: localStorage["totalCount"],
  };
  $.ajax({
    type: "POST",
    url: getCountUrl,
    data: accessData,
    success: function (response) {
      var rsp = $.trim(response);
      localStorage["totalCount"] = rsp;
      $(".show_atm_count").html(localStorage["totalCount"]);
      $(".show_atm_count_fmt").html(
        localStorage["totalCount"]
          .toString()
          .replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"),
      );
      // console.log(localStorage['totalCount']);
    },
  });
  // END Get total count ////////////////

  /////////////////////////  REAL TIME ///////////////////////////////////////////////
  //START Get In Service
  $.ajax({
    type: "POST",
    url: getInserviceUrl,
    data: accessData,
    success: function (response) {
      var rsp = $.trim(response);
      var parsJson = JSON.parse(rsp);
      $("#in-service-perc").html(parsJson["percentage_active"]);
      $("#in-service-count").html(parsJson["total_active"]);

      // console.log(parsJson['percentage_active']);
      // console.log(parsJson['total_active']);
    },
  });
  //END Get In Service

  //START Get Offline
  $.ajax({
    type: "POST",
    url: getOfflineUrl,
    data: accessData,
    success: function (response) {
      var rspO = $.trim(response);
      var parsJsonO = JSON.parse(rspO);
      $("#offline-perc").html(parsJsonO["percentage_offline"]);
      $("#offline-count").html(parsJsonO["total_offline"]);

      // console.log(parsJsonO['percentage_offline']);
      // console.log(parsJsonO['total_offline']);
    },
  });
  //END Get Offline

  //START Get Closed
  $.ajax({
    type: "POST",
    url: getClosedUrl,
    data: accessData,
    success: function (response) {
      var rspC = $.trim(response);
      var parsJsonC = JSON.parse(rspC);
      $("#closed-perc").html(parsJsonC["percentage_closed"]);
      $("#closed-count").html(parsJsonC["total_closed"]);

      // console.log(parsJsonC['total_closed']);
      // console.log(parsJsonC['percentage_closed']);
    },
  });
  //END Get Closed

  //START Get Supervisor
  $.ajax({
    type: "POST",
    url: getSuperUrl,
    data: accessData,
    success: function (response) {
      var rspS = $.trim(response);
      var parsJsonS = JSON.parse(rspS);
      $("#supervisor-perc").html(parsJsonS["percentage_supervisor"]);
      $("#supervisor-count").html(parsJsonS["total_supervisor"]);

      // console.log(parsJsonS['percentage_supervisor']);
      // console.log(parsJsonS['total_supervisor']);
    },
  });
  //END Get Supervisor

  /////////////////////////  CASH LEVEL ///////////////////////////////////////////////

  //START Get Cash Jam
  $.ajax({
    type: "POST",
    url: getcashJamUrl,
    data: accessData,
    success: function (response) {
      var rspCJ = $.trim(response);
      var parsJsonCJ = JSON.parse(rspCJ);
      $("#per-cashjam").html(parsJsonCJ["percentage_cashjam"]);
      $("#total-cashjam").html(parsJsonCJ["total_cashjam"]);

      // console.log(parsJsonCJ['percentage_cashjam']);
      // console.log(parsJsonCJ['total_cashjam']);
    },
  });
  //END Get Cash Jam

  //START Get No Cash
  $.ajax({
    type: "POST",
    url: getNoCashUrl,
    data: accessData,
    success: function (response) {
      var rspNC = $.trim(response);
      var parsJsonNC = JSON.parse(rspNC);
      $("#per-nocash").html(parsJsonNC["percentage_nocash"]);
      $("#total-nocash").html(parsJsonNC["total_nocash"]);

      // console.log(parsJsonNC['percentage_nocash']);
      // console.log(parsJsonNC['total_nocash']);
    },
  });
  //END Get No Cash

  //START Get Low Cash
  $.ajax({
    type: "POST",
    url: getLowCashUrl,
    data: accessData,
    success: function (response) {
      var rspLC = $.trim(response);
      var parsJsonLC = JSON.parse(rspLC);
      $("#per-lowcash").html(parsJsonLC["percentage_lowcash"]);
      $("#total-lowcash").html(parsJsonLC["total_lowcash"]);

      // console.log(parsJsonLC['percentage_lowcash']);
      // console.log(parsJsonLC['total_lowcash']);
    },
  });
  //END Get Low Cash

  //START Get Moderate Cash
  $.ajax({
    type: "POST",
    url: getModerateCashUrl,
    data: accessData,
    success: function (response) {
      var rspMC = $.trim(response);
      var parsJsonMC = JSON.parse(rspMC);
      $("#per-moderatecash").html(parsJsonMC["percentage_moderatecash"]);
      $("#total-moderatecash").html(parsJsonMC["total_moderatecash"]);

      // console.log(parsJsonMC['percentage_moderatecash']);
      // console.log(parsJsonMC['total_moderatecash']);
    },
  });
  //END Get Moderate Cash

  //START Get High Cash
  $.ajax({
    type: "POST",
    url: getHighCashUrl,
    data: accessData,
    success: function (response) {
      var rspHC = $.trim(response);
      var parsJsonHC = JSON.parse(rspHC);
      $("#per-highcash").html(parsJsonHC["percentage_highcash"]);
      $("#total-highcash").html(parsJsonHC["total_highcash"]);

      // console.log(parsJsonHC['percentage_highcash']);
      // console.log(parsJsonHC['total_highcash']);
    },
  });
  //END Get High Cash

  //START Get Region
  $.ajax({
    type: "POST",
    url: getRegionsUrl,
    data: accessData,
    success: function (response) {
      var rsp = $.trim(response);
      // console.log(rsp)
      $("#load-regions").html(rsp);
      $("#load-regions-crad").html(rsp);
    },
  });
  //END Get Region

  //START Get Reporting Pages
  $.ajax({
    type: "POST",
    url: getReportingUrl,
    data: accessData,
    success: function (response) {
      var rsp = $.trim(response);
      // console.log(rsp)
      $("#load-reporting").html(rsp);
    },
  });
  //END Get Reporting Pages

  //START Get performance count //////////////////
  $.ajax({
    type: "POST",
    url: getPerfCOunt,
    data: accessData,
    success: function (response) {
      var pct_uptime = response.pct_uptime;
      var pct_avl = response.pct_avl;
      var pct_downtime = response.pct_downtime;

      $("#uptimedata").html(pct_uptime);
      $("#inprogressdata").html(pct_avl);
      $("#downtimedata").html(pct_downtime);
    },
  });
  //END Get performance count //////////////////
} else {
  // console.log("Login to show total count");
}
// END: User logged in specifuc script execution /////////////////////////////////////

// START: Add to Audit Log ////////////////////////////////////////////
function addToAudit(audit_text, target_view, app_module) {
  var data = {
    name: localStorage["uname"],
    audit_text: audit_text,
    target_view: target_view,
    app_module: app_module,
  };
  $.ajax({
    url: addToAuditUrl,
    data: data,
    type: "POST",
    success: function (response) {
      var resp = $.trim(response);
      if (resp == "success") {
        // window.location.href = page;
        // console.log("Audit Added");
      }
      if (resp == "failed") {
        // console.log("Audit Failed");
      }
    },
  });
}
// END: Add to Audit Log ////////////////////////////////////////////

initload = function (page) {
  var filename = page;
  // alert(filename);
  // START loading for reporting ////////////////
  if (filename == "monall.html") {
    localStorage["filter_rpt"] = "All";
    window.location.href = filename;
  }
  if (filename == "monidle.html") {
    localStorage["filter_rpt"] = "Idle";
    window.location.href = filename;
  }
  if (filename == "mononline.html") {
    localStorage["filter_rpt"] = "Online";
    window.location.href = filename;
  }
  if (filename == "monoffline.html") {
    localStorage["filter_rpt"] = "Offline";
    window.location.href = filename;
  }
  if (filename == "monclosed.html") {
    localStorage["filter_rpt"] = "Closed";
    window.location.href = filename;
  }
  if (filename == "monsupervisor.html") {
    localStorage["filter_rpt"] = "Supervisor";
    window.location.href = filename;
  }
  if (filename == "moncashjam.html") {
    localStorage["filter_rpt"] = "Cash Jam";
    window.location.href = filename;
  }
  if (filename == "monnocash.html") {
    localStorage["filter_rpt"] = "No Cash";
    window.location.href = filename;
  }
  if (filename == "monlowcash.html") {
    localStorage["filter_rpt"] = "Low Cash";
    window.location.href = filename;
  }
  if (filename == "monmoderatecash.html") {
    localStorage["filter_rpt"] = "Moderate Cash";
    window.location.href = filename;
  }
  if (filename == "monhighcash.html") {
    localStorage["filter_rpt"] = "High Cash";
    window.location.href = filename;
  }

  if (filename == "terminallookup.html") {
    localStorage["filter_rpt"] = "Terminal Lookup";
    window.location.href = filename;
  }
  if (filename == "pendingupload.html") {
    localStorage["filter_rpt"] = "Pending Upload";
    window.location.href = filename;
  }
  if (filename == "perfrealt.html") {
    localStorage["filter_rpt"] = "Performance RealTime";
    window.location.href = filename;
  }
  if (filename == "backedoutterms.html") {
    localStorage["filter_rpt"] = "BackedOut Terminals";
    window.location.href = filename;
  }
  if (filename == "perfreport.html") {
    localStorage["filter_rpt"] = "Performance Report";
    window.location.href = filename;
  }
  // END loading for reporting ////////////////

  return false;
};

// START: DATE MIN MAX ////////////////////////////////////////////////////
let page_path = window.location.pathname;
let page_file = page_path.substring(page_path.lastIndexOf("/") + 1);
if (page_file == "perfreport.html") {
  var presentDates = new Date();

  // PRESENT DATE
  var dd = presentDates.getDate();
  var mm = presentDates.getMonth() + 1;
  var yyyy = presentDates.getFullYear();

  // PAST DATE
  var pastDates = new Date(presentDates);
  pastDates.setDate(pastDates.getDate() - 6);

  var dd2 = pastDates.getDate();
  var mm2 = pastDates.getMonth() + 1;
  var yyyy2 = pastDates.getFullYear();

  if (dd < 10 && dd2 < 10) {
    dd = "0" + dd;
    dd2 = "0" + dd2;
  }

  if (mm < 10 && mm2 < 10) {
    mm = "0" + mm;
    mm2 = "0" + mm2;
  }

  pastDates = yyyy2 + "-" + mm2 + "-" + dd2;
  presentDates = yyyy + "-" + mm + "-" + dd;

  document.getElementById("between_date").setAttribute("min", pastDates);
  document.getElementById("between_date").setAttribute("max", presentDates);

  document.getElementById("and_date").setAttribute("max", presentDates);
  document.getElementById("and_date").setAttribute("min", pastDates);

  document.getElementById("and_date").setAttribute("value", presentDates);
  document.getElementById("between_date").setAttribute("value", presentDates);

  //console.log("PRESENT DATE : " + presentDates);
  // console.log("MY PAST DATE : " + pastDates);
} else {
  console.log("OTHER PAGES: " + page_file);
}
// END: DATE MIN MAX //////////////////////////////////////////////////////

//START: Logout ////////////////////////////////////////////////////
function logOut() {
  localStorage.clear();
  sessionStorage.clear();
  localStorage["vst"] = true;
  window.location.href = "login.html";
}
//END: Logout //////////////////////////////////////////////

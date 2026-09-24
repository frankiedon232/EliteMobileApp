document.addEventListener("deviceready", onDeviceReady, false);
var platform;

function onDeviceReady() {

    // var deviceVersion = parseInt(device.version);
    platform = cordova.platformId;

    setInterval(function() {
        checkConnection();
    }, 5000);

    // Lock screen orientation
    lockLamscape();

    // Init get device toket for push notification //
    // getDeviceToken();

    //notificationOpened();
}

// Check connection always
function checkConnection() {
    var networkState = navigator.connection.type;
    if (networkState !== Connection.NONE) {
        // if connected then it ok
        //alert("you are connected to " + networkState);
    } else {
        dialogAlert("No internet connection. Connect to network to continue ", "Not Connected", "Try Again")
    }

}

// Lock lanscape
function lockLamscape() {
    screen.orientation.lock('portrait').then(function success() {
        //alert("locked lanscaped");
    }, function error(errMsg) {
        // console.log("Erro locking screen orientation " + errMsg);
        // console.log('Orientation is ' + screen.orientation.type);
    });
}

// SImulate notification 
function dialogAlert(msg, ttl, btn) {
    var message = msg;
    var title = ttl;
    var buttonName = btn;
    navigator.notification.alert(message, alertCallback, title, buttonName);

    function alertCallback() {
        console.log("Alert is Dismissed!");
    }
}


// Normal Dialig
function alertNormal(msg, ttl, btn) {
    var message = msg;
    var title = ttl;
    var buttonName = btn;
    navigator.notification.alert(message, alertCallback, title, buttonName);

    function alertCallback() {
        console.log("Notification Closed");
    }
}

// Get Device Token
function getDeviceToken() {
    window.FirebasePlugin.onTokenRefresh(function(token) {
        // save this server-side and use it to push notifications to this device
        console.log("DEVICE TOKEN: " + token);
    }, function(error) {
        console.error("TOKEN ERROR: " + error);
    });
}


// Check when notification is opened [Register notification callback: onNotificationOpen]
function notificationOpened() {
    window.FirebasePlugin.onNotificationOpen(function(notification) {

        wakeDeviceOnNotification();

        console.log('NOTIFICATION OPENED: ' + JSON.stringify(notification));

        // Show the notification when the app in background - that means app is closed or in foreground
        if (notification.tap) {
            console.log("Tapped Notification: " + notification.tap);
            console.log("user tapped on message notification");

            // Redirect from here to a page
        } else {
            // App is open so still show notification.
            // Log details. // This is to help send notification from here// But this time use local notification
            console.log("Tapped Notification: " + notification.tap);
            console.log("Notification Body: " + notification.body);
            console.log("Notification Title: " + notification.title);

            sendNotifLocal(notification.body, notification.title);
        }
    }, function(error) {
        console.error('NOTIFICATION OPEN ERROR' + error);
    });
}

// Create a local notification function
function sendNotifLocal(body, title) {
    cordova.plugins.notification.local.schedule({
        id: Math.floor(Math.random() * 101),
        title: title,
        text: body,
        vibrate: true,
        lockscreen: true,
        foreground: true
    });
}

// Local notifiation  event
/*
cordova.plugins.notification.local.on("yes", function(notification) {
    console.log("LOCAL NOTIFICATION SCHEDULED");
    console.log(notification.data);
});
*/

// Wake Device up on nitification is phone idle
function wakeDeviceOnNotification() {
    window.powerManagement.acquire(function() {
        console.log('Wakelock acquired');
    }, function() {
        console.log('Failed to acquire wakelock');
    });
}

// Release wake lock on finish 
function relaaseDeviceWake() {
    window.powerManagement.release(function() {
        console.log('Wakelock released');
    }, function() {
        console.log('Failed to release wakelock');
    });
}
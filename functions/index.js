const {google} = require("googleapis");
const fetch = require("node-fetch");
const functions = require("firebase-functions");
const serviceAccount = require("./serviceAccountKey.json");

exports.sendNotification = functions.https.onRequest(async (req, res) => {
  try {
    const payload = {
      message: {
        notification: {
          title: req.body.title,
          body: req.body.body,
          image: req.body.image,
        },
        android: {
          priority: "high",
          notification: {
            channel_id: "high_importance_channel",
            sound: "default",
          },
        },
        apns: {
          payload: {
            aps: {
              sound: "default",
              category: "high_importance",
            },
          },
        },
        data: {
          click_action: "FLUTTER_NOTIFICATION_CLICK",
          title: req.body.title,
          image: req.body.image,
          message: req.body.body,
          orderId: req.body.orderId,
          type: req.body.type,
        },
      },
    };
    // Authenticate using Google Auth
    const authClient = new google.auth.GoogleAuth({
      credentials: serviceAccount,
      scopes: ["https://www.googleapis.com/auth/cloud-platform"],
    });

    const accessToken = await authClient.getAccessToken();
    if (req.body.topic) {
      payload.message.topic = req.body.topic;
    } else if (req.body.token) {
      payload.message.token = req.body.token;
    }

    const response = await fetch(
        `https://fcm.googleapis.com/v1/projects/drfootapp-2a1c8/messages:send`,
        {
          method: "POST",
          headers: {
            "Authorization": `Bearer ${accessToken}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify(payload),
        });
    // console.log("Successfully sent message:", response);
    // res.status(200).send("Notification sent successfully");
    // Validate the response
    if (!response.ok) {
      const errorData = await response.json();
      console.error("Error sending message:", errorData);
      return res.status(500).json({
        message: "Notification failed to send",
        error: errorData,
      });
    }
    const responseData = await response.json();
    console.log("Successfully sent message:", responseData);
    res.status(200).json({
      message: "Notification sent successfully",
      response: responseData,
    });
  } catch (error) {
    console.error("Error sending message:", error);
    res.status(500).send("Notification failed to send");
  }
});

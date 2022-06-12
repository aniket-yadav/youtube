<?php  
include 'razorpay_credentials.php';
require('razorpay-php/Razorpay.php');

use Razorpay\Api\Errors\SignatureVerificationError;
use Razorpay\Api\Api;

$success = true;

$error = "Payment Failed";

try{
$razorpaySignature = $_POST["razorpay_signature"];
$razorpayPaymentId = $_POST["razorpay_payment_id"];
$razorpayOrderId = $_POST["razorpay_order_id"];
$key_id = $keyId;
$key_secret = $keySecret;
$api = new Api($key_id, $key_secret);
$attributes  = array('razorpay_signature'  => $razorpaySignature,  'razorpay_payment_id'  => $razorpayPaymentId ,  'razorpay_order_id' => $razorpayOrderId);
$order  = $api->utility->verifyPaymentSignature($attributes);
}catch(SignatureVerificationError $e){
$success = false;
        $error = 'Razorpay Error : ' . $e->getMessage();
}
if ($success === true) {
    $message = "Your payment was successful\nPayment ID: {$_POST['razorpay_payment_id']}";
} else {
    $message = "Your payment failed\n{$error}";
}
echo $message;
?>

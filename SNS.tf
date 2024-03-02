# Create an SNS Topic
resource "aws_sns_topic" "user_updates" {
  name                        = "dev-sns-topic"
}
 
# Create an SNS Topic Subscription
resource "aws_sns_topic_subscription" "notification_topic" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = var.sns_subscription_email
}
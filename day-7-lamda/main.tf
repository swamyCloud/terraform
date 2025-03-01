resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lamda_function"
  role          = "arn:aws:iam::626635413774:role/aws-lamda"
  handler       = "lamda_function.lamda_handler"
  runtime       = "python3.12"
  timeout       = 900
  memory_size   = 128

  filename         = "lamda_function.zip"  # Ensure this file exists
  source_code_hash = filebase64sha256("lamda_function.zip")
}
output "hello_world" {
  value = "Hello, World!"
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}
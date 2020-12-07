package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformBucketExample(t *testing.T) {
	bucketName := "terraform-module-example-bucket.stone.com.br"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../",
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},
		Vars: map[string]interface{}{
			"bucket_name": bucketName,
		},
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApplyAndIdempotent(t, terraformOptions)

	// Run `terraform output` to get the values of output variables and check they have the expected values.
	output := terraform.Output(t, terraformOptions, "bucket_name")
	assert.Equal(t, bucketName, output)
}

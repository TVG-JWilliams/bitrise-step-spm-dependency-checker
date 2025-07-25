#!/bin/bash
set -ex
#!/bin/bash

# Initialize the command with the base command
cmd="dependency-check --enableExperimental"

if [ "$should_update" == "no" ]; then
  cmd+=" --noupdate"
fi

# Add optional arguments if they are set
if [ -n "$fail_on_cvss_level" ]; then
  cmd+=" --failOnCVSS $fail_on_cvss_level"
fi

if [ -n "$app_title" ]; then
  cmd+=" --project $app_title"
fi

if [ -n "$spm_file_path" ]; then
  cmd+=" --scan $spm_file_path/**/Package.resolved"
fi

if [ -n "$output_file_format" ]; then
  cmd+=" -f $output_file_format"
fi

if [ -n "$api_key" ]; then
  cmd+=" --nvdApiKey $api_key"
fi

if [ -n "$deploy_dir" ]; then
  cmd+=" --out $deploy_dir"
fi

# Execute the command
eval $cmd

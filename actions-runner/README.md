# vuongpdz-zigexn-dev-runner

**Download**

```console
# Create a folder
$ mkdir actions-runner && cd actions-runner
# Download the latest runner package
$ curl -O -L https://github.com/actions/runner/releases/download/v2.276.1/actions-runner-linux-x64-2.276.1.tar.gz
# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.276.1.tar.gz
```

**Configure**

```console
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/vuongpdz/gh_api_test --token <token>
# Last step, run it!
$ ./run.sh
```

**Using your self-hosted runner**

```console
# Use this YAML in your workflow file for each job
runs-on: self-hosted
```

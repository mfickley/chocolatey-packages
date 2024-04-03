# chocolatey-packages
Yum.  Chocolatey.

## Creating a new Chocolatey Package

```bash
~/chocolatey-packages$ choco new {packageName}
```
This will create a standard directory structure for a chocolatey packageName

Follow the instructions provided in the generated "TODO" file.

Whenever you want to create the package (.nupkg), run:
```bash
~/chocolatey-packages/{packageName}$ choco pack
```

## Testing the Chocolatey Package
If you want to, you can test installing the package locally.
```bash
~/chocolatey-packages/{packageName}$ choco install {packageName} --debug --verbose --source . 
```

## Deploying the package to the Nexus Repository
### Initial Setup
```bash
# add the repos as sources
choco source add -n testNexus -s http://10.4.201.12:443/repository/test-repository/
choco source add -n prodNexus -s http://10.4.201.12:443/repository/prod-repository/

#add your API key so that you can upload to the repo
choco apikey -s http://10.4.201.12:443/repository/test-repository/ -k {api_key}
choco apikey -s http://10.4.201.12:443/repository/prod-repository/ -k {api_key}
```

### Pushing the packages to the repo
```bash
choco push {packageName} --source {sourceName}
```
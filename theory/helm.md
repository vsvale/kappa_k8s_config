## Commands

- Install chart: `helm install release_name and name_of_chart_you_want_to_install`
- List deploys: `helm list`
- Revision number: `helm history release_name`
- Rollback: `helm rollback release_name revision_id`
- Upgrade a release: `helm upgrade release_name chart_name`
- Download char repo: `helm pull chartname -d destination/folder`
# Request Tracker on OpenShift
A quick start for deploying [BestPractical Request Tracker](https://bestpractical.com/rt/) on OpenShift.

## Prereqs and Installation
You must build your gear with the following cartridges:

* cron-1.4
* perl-5.10
* postgresql-9.2 (not tested with older postgres)

If you create your gear with the console, do *NOT* use the git url, your deployment will fail until the prerequisites are installed.

The easiest way to create the appropriate gear is using the `rhc` command:

        rhc app create <NAME> perl-5.10 cron-1.4 postgresql-9.2

Clone your OpenShift git repo:

        git clone <APP CLONE URI> <DIRECTORY>

Add the GitHub repo for RT:

        git remote add github https://github.com/thiagoalmeidasa/rt-openshift.git
        git pull -s theirs github master

Push your changes back into OpenShift:

        git push origin master

After a while your installation will finish and you will be able to login to the instance with the default username (`root`) and password (`password`).

# Configuration

## RT_SiteConfig.pm
The stock file `RT_SiteConfig.pm` is replaced by the one in [configs/RT_SiteConfig.pm](configs/RT_SiteConfig.pm).
This file will use the variable `${OPENSHIFT_APP_DNS}` to change the settings for `__HOSTNAME__` and `__REFERRERS__`.
You should additionally add any aliases you configure to the line `Set( @ReferrerWhitelist, qw(__REFERRERS__:80 rt.goozbach.net:80) );`.

# NOTES/Bugs
* An [open OpenShift bug](https://bugzilla.redhat.com/show_bug.cgi?id=1046753) keeps Perl cartridges from overriding system Perl modules, therefore the `pre_build` hook installs the `Encode` module manually with `cpanm`.

# TODO
* Need to enable the security best practices to generate a custom username/passwd instead of stock upstream password

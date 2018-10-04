# Contributing to Forest IAM service

We'd love for you to contribute to our source code and to make the Forest even better than it is
today! Here are the guidelines we'd like you to follow:

 - [Question or Problem?](#question)
 - [Issues and Bugs](#issue)
 - [Feature Requests](#feature)
 - [Submission Guidelines](#submit)
 - [Coding Rules](#rules)
 - [Commit Message Guidelines](#commit)
 - [Further Info](#info)

## <a name="question"></a> Got a Question or Problem?

If you have questions about how to use the Forest, please direct these to the [Slack group / forest][slack] and look
into the [Forest documentation][forest].

## <a name="issue"></a> Found an Issue?

If you find a bug in the source code or a mistake in the documentation, you can help us by
submitting an issue to our [Gitlab Repository][gitlab]. Even better you can submit a Merge Request
with a fix.

**Please see the [Submission Guidelines](#submit) below.**

## <a name="feature"></a> Want a Feature?

You can request a new feature by submitting an issue to our [Gitlab Repository][gitlab]. If you
would like to implement a new feature then consider what kind of change it is:

* **Major Changes** that you wish to contribute to the project should be discussed first on our
  [Slack group][slack] so that we can better coordinate our efforts,
  prevent duplication of work, and help you to craft the change so that it is successfully accepted
  into the project.
* **Small Changes** can be crafted and submitted to the [Gitlab Repository][gitlab] as a Merge
  Request.


## <a name="docs"></a> Want a Doc Fix?

If you want to help improve the docs, it's a good idea to let others know what you're working on to
minimize duplication of effort. Create a new issue (or comment on a related existing one) to let
others know what you're working on.

For large fixes, please build and test the documentation before submitting the MR to be sure you
haven't accidentally introduced any layout or formatting issues. You should also make sure that your
commit message starts with "docs" and follows the **[Commit Message Guidelines](#commit)** outlined
below.

## <a name="submit"></a> Submission Guidelines

### Submitting an Issue
Before you submit your issue search the archive, maybe your question was already answered.

If your issue appears to be a bug, and hasn't been reported, open a new issue. Help us to maximize
the effort we can spend fixing issues and adding new features, by not reporting duplicate issues.
Providing the following information will increase the chances of your issue being dealt with
quickly:

* **Overview of the Issue** - if an error is being thrown a non-minified stack trace helps
* **Motivation for or Use Case** - explain why this is a bug for you
* **Forest Version(s)** - is it a regression?
* **Reproduce the Error** - try to describe how to reproduce the error
* **Related Issues** - has a similar issue been reported before?
* **Suggest a Fix** - if you can't fix the bug yourself, perhaps you can point to what might be
  causing the problem (line of code or commit)

**If you get help, help others. Good karma rulez!**

### Submitting a Merge Request
Before you submit your merge request consider the following guidelines:

* Make your changes in a new git branch:

    ```shell
    git checkout -b my-fix-branch master
    ```

* Create your patch, **including appropriate test cases**.
* Run the test suite by running `/ci/forest/bin/build`,
  and ensure that all tests pass.
* Add a line in the CHANGELOG.md under Unreleased. This will be used form generating the release notes.
* Commit your changes using a descriptive commit message.

    ```shell
    git commit -a
    ```
  Note: the optional commit `-a` command line option will automatically "add" and "rm" edited files.

* Build your changes locally to ensure all the tests pass:

    ```shell
    ./ci/forest/bin/build
    ```

* Push your branch to Gitlab:

    ```shell
    git push origin my-fix-branch
    ```

In Gitlab, send a pull request to original master branch: f.e. `forest.micro/fact-service:master`.
If we suggest changes, then:

* Make the required updates.
* Re-run the test suite to ensure tests are still passing.
* Commit your changes to your branch (e.g. `my-fix-branch`).
* Push the changes to your Gitlab repository (this will update your Merge Request).

If the MR gets too outdated we may ask you to rebase and force push to update the MR:

```shell
git rebase master -i
git push origin my-fix-branch -f
```

_WARNING: Squashing or reverting commits and force-pushing thereafter may remove Gitlab comments
on code that were previously made by you or others in your commits. Avoid any form of rebasing
unless necessary._

That's it! Thank you for your contribution!

#### After your merge request is merged

After your pull request is merged, you can safely delete your branch and pull the changes
from the main (upstream) repository:

* Delete the remote branch on Gitlab either through the Gitlab web UI or your local shell as follows:

    ```shell
    git push origin --delete my-fix-branch
    ```

* Check out the master branch:

    ```shell
    git checkout master -f
    ```

* Delete the local branch:

    ```shell
    git branch -D my-fix-branch
    ```

* Update your master with the latest upstream version:

    ```shell
    git pull --ff upstream master
    ```

## <a name="info"></a> Further Information
You can find out more detailed information in the
[Forest documentation][forest].


[contribute]: CONTRIBUTING.md
[forest]: https://gitlab.natlab.research.philips.com/forest/flora/blob/master/index.md
[gitlab]: https://gitlab.natlab.research.philips.com/forest.micro/hapi-service/issues
[slack]: https://ideafactoryteam.slack.com/home

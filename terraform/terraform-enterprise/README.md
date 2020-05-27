# Terraform Enterprise


Terraform Enterprise is the self-hosted distribution of Terraform Cloud. It offers enterprises a private instance of the Terraform Cloud application, with no resource limits and with additional enterprise-grade architectural features like audit logging and SAML single sign-on.

Terraform Cloud is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations, and more.

For independent teams and small to medium-sized businesses, Terraform Cloud is also available as a hosted service at https://app.terraform.io.


![](images/terraformfeatures.jpg)






## Terraform WorkFlow

![](images/TerraformEnterpriseWorkflow.png)


**Workspaces:** Infrastructure is organized using Workspaces in TFE. Workspace consists of Terraform configuration, variables, run history and Terraform state information.

**Terraform Statefile Management:** This may not sound a big deal but I have seen 100s of state files created. Managing a large volume of state files can get tricky. TFE takes care of managing state files.

**Private Module Registry:** A central service registry to publish Terraform modules. Modules work as building blocks of complex infrastructures.

**Sentinel  Integrated policy-as-a-code framework:**  You can implement policies that are enforced at the Terraform plan level. For example — admins can easily set up a policy that would stop developers from spinning up large instances in AWS. This violation is caught as soon as developers check-in Terraform files. This is one example of many, powerful, policy-based protections we can put in place.


# Using Terraform Enterprise — Create Infrastructure

## Create a Organization:

Organizations are a shared space for teams to collaborate on workspaces in Terraform Cloud.

Users can create new organizations by clicking the "Create new organization" button in the organization switcher menu. The new organization page also displays automatically when the currently logged-in user does not belong to any organizations, as when first logging in as a new user.

![](images/createorganization.png)


To create a new organization, provide a unique name and a primary contact email address. Organization names can include numbers, letters, underscores (_), and hyphens (-).

Once you have created an organization, you can invite other users from your organization settings.

## Organization settings:

You can view and manage an organization's settings by clicking the "Settings" link in the top navigation bar.

Only organization owners can manage an organization's settings. However, other users can use this section to view the organization's contact email, view the membership of any teams they belong to, and view the organization's authentication policy.

![](images/organizationsettings.png)

**General**
The general settings page is shown to all users in an organization, and displays the organization's name and contact email.

Organization owners can use this page to update the organization's contact email or delete the organization.

**Plan & Billing**
The plan and billing page allows organization owners to upgrade to one of Terraform Cloud's paid plans, downgrade to a free plan, or begin a free trial of paid features. It also displays any invoices for previous plan payments.

**Users**
The users page allows organization owners to invite new Terraform Cloud users into the organization, cancel invitations, and remove existing members.

The list of users is split into two tabs: one for currently active users, and one for invited users who haven't accepted their invitations yet. If the lists are large, you can filter them by username or email using the search field at the top. For active users, the list includes usernames, email addresses, avatar icons, two-factor authentication status, and current team memberships.

![](images/organizationuser.png)
















## Create A Workspace :

It is recommended to create a workspace per application per environment. E.g. For a given app, there can be workspaces for Dev, Test and Prod environment.

![](images/createworskpaces.jpg)


## How Terraform Cloud Uses VCS Access
Most workspaces in Terraform Cloud are associated with a VCS repository, which provides Terraform configurations for that workspace. To find out which repos are available, access their contents, and create webhooks, Terraform Cloud needs access to your VCS provider.

Although Terraform Cloud's API lets you create workspaces and push configurations to them without a VCS connection, the primary workflow expects every workspace to be backed by a repository.

**To use configurations from VCS, Terraform Cloud needs to do several things:**

- Access a list of repositories, to let you search for repos when creating new workspaces.
- Register webhooks with your VCS provider, to get notified of new commits to a chosen branch.
- Download the contents of a repository at a specific commit in order to run Terraform with that code.

## Webhooks
**Terraform Cloud uses webhooks to monitor new commits and pull requests.**

- When someone adds new commits to a branch, any Terraform Cloud workspaces based on that branch will begin a Terraform run. Usually a user must inspect the plan output and approve an apply, but you can also enable automatic applies on a per-workspace basis. You can prevent automatic runs by locking a workspace.

- When someone submits a pull request/merge request to a branch, any Terraform Cloud workspaces based on that branch will perform a speculative plan with the contents of the request and links to the results on the PR's page. This helps you avoid merging PRs that cause plan failures.









## Setup Variables (Terraform & Environment Variables):

Setup Terraform variables and environment variables. In Environment Variable image below, note the checkbox to indicate that variable has sensitive information. If this checkbox is selected, data is encrypted and can not be read or updated. This allows admins to store secrets/keys in a secure way.


![](images/terraformvariables.jpg)




# Queue Plan (Run the Terraform configuration):

First, it runs a Terraform plan and then waits for confirmation to run Terraform apply.


![](images/plan.jpg)




![Terraform Apply](images/terraformapply.jpg)

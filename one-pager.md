# Eagle Rationale

"Start as you mean to go on" is a moral exhortation, in line with Levvel's core value of "Excellence as habit".  

Eagle is a project and a process for creating and maintaining related software deliveries, in line with what a client might need within a line of business, what Levvel might need for various internal projects, or what a standalone internal initiative like Zimulator might need.  In my work, it represents the boundaries of what I might call "a shop" with a cross-functional team working to supply what's needed as best they can.

These needs include, but are not limited to, the following:

* Source control repositories of various software
* Builds that test the contents of these repositories and create deployable artifacts
* Deployments where those artifacts are exposed to human (and machine) users
* Supporting services like databases, caches, or message buses that enable architectures of this software.
* Network routing and naming to make the deployments straightforward to use, as well as secure
* Infrastructure automation to create repeatability and support the shop as it grows and changes over time
* Modularity to accomodate specific situations that cannot be solved in the general sense
* Authentication and authorization to control what actors can and cannot do within its bounds, including engineering staff
* Monitoring of events of all kinds (business, application, operational) to report on health and progress of the shop's business value generation
* Standards intended to satisfy the most stringent compliance and security protocols, even in cases where those protocols do not apply.

My tenure as a Principal Consultant at Levvel, where I both helped sell important initiatives as well as aided projects under strain, indicated to me that many of these needs could be provided by a suite of internal technologies.  It was important for this suite to be internally developed and maintained, because of the difficulty in selling both our consulting work as well as any particular vendor product inside the scope of an engagement.  Further, its scope would allow for training using a real internal product and platform where real benefits would be available to the trainee, as well as their colleagues.

Eagle would be intended for use in engagements where the headcount might range from 12-50.  (Larger than that would probably want 2-3 usages)  In the simplest cases, Eagle could be used by pre-sales staff to create a working development environment "out of the box" after walking through a questionnaire with a prospect.  Eagle takes 2-3 hours to create a shop from scratch.  In more complex cases, trained engineering staff could use Eagle to demonstrate various technical complexities for which we can already demonstrate mastery, rather than needing to replicate those solutions again from scratch on their behalf.

Eagle could be as prominent as a renamed differentiator in the marketplace that we use as a compliment in our sales cycle all the way down to an internal tool that people who start projects frequently are aware of and form community around.

It is a spiritual successor to the Levvel CLI, which did attract a community, but struggled to find deep, committed, driving project ownership and maintenance.  Indeed, an Endava CLI could be a natural follow-on to Eagle, with more of a focus on development staff.  Eagle is certainly one leg of a vision for how the engineering practice of a technical consultancy could deliver the most client value possible, while also creating an enriching and pleasing environment for teammates.


Core technologies:
Kubernetes / Kustomize
Containers (Docker/OCI)
Tekton
Flux2
Git

Technologies selected for initial support:
GitHub
Azure
Ansible
Angular
Java (Spring Boot)
MongoDB
RabbitMQ
Slack
Sentry
Helm


Roadmap support includes:
AWS
Terraform
PostgreSQL
GitLab 
BitBucket
Azure DevOps
Role Name
=========


Diese Roller erstellt:

* K8s-Namespaces
* `k8s_namespace_list` wird zum bauen der Namespace verwendet.
* Ein passender `admin` user mit dem Namen `<namespace>-admin` wird in der Rolle `kubernetes-ca-manager` erledigt.
* Derzeit schreibt die Rolle lediglich die passende Konfiguration, welche dann via `kubectl` ausgefüht werden muss.


Requirements
------------

Wir setzen voraus, dass die Rolle `kubernetes-ca-manager` existiert.
In dieser werden die Credentials der User erstellt.


Role Variables
--------------

| Name                      | Description                                         | Mandatory       | Default
| ------------------------- | --------------------------------------------------- | --------------- | ------------------
| k8s_namespaces:           | Ein Array von Namespaces. Zu jedem Namespace wir    | no              | 
|                           | ein admin user `admin.{{ item }}` erstellt          |                 |

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).




![screenshot](./images/IBM-Security.png)

# XDR and QRadar Malware Demo (Complete Guide)


***Nick Mumaw & Craig Finley, Americas Technical Sales Lead, SOAR***

---

**Table of Contents:**

  - [Part I: The Set Up](#part-i-the-set-up)
      - [Accessing QRadar SIEM and XDR Connect Instance](#accessing-qradar-siem-and-xdr-connect-instance)
        - [Step 0: Obtaining Environment Access](#step-0-obtaining-environment-access)
      - [Configuring Permissions and Installing Apps](#configuring-permissions-and-installing-apps)
        - [Step 1: Grant Yourself Administrator Permissions](#step-1-grant-yourself-administrator-permissions)
        - [Step 2: Download QRadar Functions for SOAR](#step-2-download-qradar-functions-for-soar-from-x-force-exchange--app-exchange)
        - [Step 3: Installing QRadar Functions for SOAR](#step-3-installing-qradar-functions-for-soar-application)
        - [Step 4: Configure QRadar Functions fo SOAR](#step-4-configure-qradar-functions-for-soar-application)
        - [Step 5: Download and Install QRadar Enhanced Data Migration](#step-5-download-and-installing-qradar-enhanced-data-migration)
        - [Step 6: Configure QRadar Enhanced Data Migration](#step-6-configure-qradar-enhanced-data-migration)
        - [Step 7: Download and Install IBM SOAR Task Helper Functions](#step-7-download-and-installing-ibm-soar-task-helper-functions-application)
        - [Step 8: Configure IBM SOAR Task Helper Functions](#step-8-configure-ibm-soar-task-helper-functions-application)
        - [Step 9: Download and Install IBM SOAR Data Table Helper Functions](#step-9-download-and-installing-ibm-soar-data-table-helper-functions)
        - [Step 10: Configure IBM SOAR Data Table Helper Functions](#step-10-configure-ibm-soar-data-table-helper-functions)
        - [Step 11: Download and Install Timer Function for SOAR](#step-11-download-and-installing-timer-function-for-soar)
        - [Step 12: Configure Timer Function for SOAR](#step-12-configure-timer-function-for-soar)
        - [Step 13: Download and Install MITRE ATT&CK Integration for SOAR](#step-13-download-and-installing-mitre-attck-integration-for-soar)
        - [Step 14: Configure MITRE ATT&CK Integration for SOAR](#step-14-configure-mitre-attck-integration-for-soar)
        - [Step 15: Installing ServiceNow Functions for IBM SOAR](#step-15-download-and-installing-servicenow-functions-for-ibm-soar-application)
        - [Step 16: Installing LDAP and Active Directory Functions for SOAR](#step-16-download-and-installing-ldap-and-active-directory-functions-for-soar)
        - [Step 17: Installing CrowdStrike Falcon Insight and Threat Intel](#step-17-download-and-installing-crowdstrike-falcon-insight-and-threat-intel)
      - [Data Tables](#data-tables)
        - [Step 18: Create the Data Table for LDAP Users](#step-18-create-the-data-table-for-ldap-users)
      - [Phases and Tasks](#phases-and-tasks)
        - [Step 19: Create the Phases](#step-19-create-the-phases)
        - [Step 20: Create the Tasks](#step-20-create-the-tasks)
      - [Playbook Design: Create your SOP Playbook](#playbook-design-create-your-sop-playbook)
        - [Step 21: Create Playbook Scope and Conditions](#step-21-create-playbook-scope-and-conditions)
        - [Step 22: Adding Tasks, Scripts, and Decision Points](#step-22-adding-tasks-scripts-and-decision-points)
        - [Step 23: Saving and Enabling your Playbook](#step-23-saving-and-enabling-your-playbook)
      - [Playbook Design: Create Your Integration Playbooks](#playbook-design-create-your-integration-playbooks)
        - [Step 24: Build MITRE ATT&CK Integration Playbook](#step-24-build-mitre-attck-integration-playbook)
      - [Playbook Import: Adding the Demo Automation](#playbook-import-adding-the-demo-automation)
        - [Step 25: Importing the Final Playbooks](#step-25-importing-the-final-playbooks)
      - [Layout Design: Cleaning up your system](#layout-design-cleaning-up-your-system)
        - [Step 26: Disabling Unused Rules](#step-26-disabling-unused-rules)
        - [Step 27: Redesigning your Incidents](#step-27-redesigning-your-incidents)
      - [Administrative Settings: Setting up Workspaces and Groups](#administrative-settings-setting-up-workspaces-and-groups)
        - [Step 28: Adding Workspaces](#step-28-adding-workspaces)
        - [Step 29: Establishing Teams](#step-29-establishing-teams)
      - [QRadar Setup: Configuring Plugins](#setting-up-qradar-siem)
        - [Step 30: Creating API Tokens/Keys](#step-30-creating-api-tokenskeys)
        - [Step 31: Enabling Use Case Manager](#step-31-enabling-use-case-manager-plugin)
        - [Step 32: Configuring IBM QRadar SOAR](#step-32-configuring-ibm-qradar-soar-plugin)
  <!--
   - [Part II: The Implementation](#part-ii-the-implementation)
      - [Putting it all Together](#putting-it-all-together)
        - [Step 33: Escalate QRadar Offense to Cases](#step-33-escalate-qradar-offense-to-cases)
        - [Step 34: Automatic Process Playbook Invoked](#step-34-automatic-process-playbook-invoked)
        - [Step 35: Perform QRadar Search for Device ID](#step-35-perform-qradar-search-for-device-id)
        - [Step 36: Isolate Host from Newly Found Device ID](#step-36-isolate-host-from-newly-found-device-id)
        - [Step 37: Create a Ticket in Service Now](#step-37-create-a-ticket-in-service-now)
    -->
   - [Part II: Bonus Demo Fun](#part-ii-bonus-demo-fun)
      - [Improving the Demo](#improving-the-demo)
        - [Step 33: Add Additional Content to the Demo](#step-33-add-additional-content-to-the-demo)

# *Part I: The Set Up*

---

## Accessing QRadar SIEM and XDR Connect Instance

### Step 0: Obtaining Environment Access

- To receive your access to your instances of **QRadar** and **XDR** in the class, you will be assigned an account number which will determine your server and username. I will provide you the following format:

 ```bash 
 QRadar - (Authenticate with Username and Password)
 Host: {{ IP Provided by Instructor }}
 Username: admin
 Password: Pass4Admin
 
 XDR - (Authenticate with IBMid and password via SAML)
 FQDN: {{ FQDN Provided by Instructor }}
 IBMid: tech-bootcamp-user-X@mailinator.com
 Password: Pass4Admin
 ```

- Once at the XDR landing page, you choose the *Authentication Type* called **Enterprise SAML** as shown below:

 ![Tech Bootcamp Lab Infrastructure](images/cp4saas-landing-page.png)


- Once prompted you will be asked to provide the **IBMid**. The *convention* we will be using for each user will be:

 > tech-bootcamp-user-X@mailinator.com

 ![Tech Bootcamp Lab Infrastructure](images/id-userame-explained.png)

 where the **X** represents an assigned number you will be given that represents your login **IBMid**. So for example, if you were assigned the number **1** your **IBMid** would be:

 > tech-bootcamp-user-1@mailinator.com   
  
- Once you have provided the appropriate **IBMid**, you will be prompted to enter the password which will be provided to you by the instructor:

 ![Tech Bootcamp Lab Infrastructure](images/password-explained.png)

---

### Step 1: *Grant Yourself Administrator Permissions*

- Once properly authenticated to XDR, you should see a screen similar to below:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-successful-login.png)
  
 Click the three horizontal line icon in the upper left corner of the screen which should produce a large drop down menu.

- The drop down menu should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-menu-dropdown.png)

 Click on **Case Management** which should produce yet another drop down menu.

- The drop down menu should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-case-management-menu-dropdown.png)
 
 Click on *Permissions and access* which will bring you to the **Administrator Settings**

- The **Administrator Settings** should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-admin-settings.png)
 
 Click on the user *Tech-Bootcamp User-X* which should then allow you to see the **User Details**.
	
 > **Note**
 > We happen to be modifying the permissions specifically for *Tech-Bootcamp User-11*.
 > Your assigned user may be different. You can choose to either use the role *Administrator* or *Master Administrator*. 

- The **User Details** for *Tech-Bootcamp User-X* should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-user-details.png)

 You are going to click the blue **Edit** button on the right-hand side to allow you to modify the user permissions.
 
- You will click on the box to the right of the **Global Roles** text in the lower left-hand part of the screen which should produce a dropdown that resembles the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-global-roles.png)

 Select *Master Administrator* then click the *Save* button.
 
- Your user should now have a *Master Administrator* Role and should resemble the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-master-admin.png)
 
- Refresh the page and you will notice that you should now have a new tab called **Apps** and should resemble the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-apps-tab.png)
 
- After selecting the **Apps** tab, you should then see the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-apps-page.png)

 You now have the means to pair the App Host server and install apps.

---

### Step 2: *Download QRadar Functions for SOAR from X-Force Exchange / App Exchange*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![QRadar Functions for SOAR install](images/xforce-app-exchange-home.png)

 > **Note:**
 > 
 > You will need an **IBMid** if you do not already have one to download any apps from **X-Force Exchange / App Exchange**.
 >  

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *QRadar Functions* which should give you the following screen below:
 
  ![QRadar Functions for SOAR install](images/app-exchage-qradar-functions.png)
  
  Click the app on the left-hand side called **QRadar Functions For SOAR**
  
- Once you are at the landing page for the application, select the blue **Download** button on the right-hand side:
 
  ![QRadar Functions for SOAR install](images/qradar-soar-function.png) 
   
- The download should begin and resemble below:

 ![QRadar Functions for SOAR install](images/qradar-function-download.png)
 
 You can close the **Extension Download** dialogue box. Now you are ready to install and configure the application.

 > **Note:**
 > 
 > The download contents will live wherever your browser defaults to. In this example, the download went to the *Downloads* folder using *Chrome* on a *Mac* computer.
 >    

---

### Step 3: *Installing QRadar Functions For SOAR Application* 

- Back in the *SOAR + Connect* Platform under **Administrator Settings** with the **Apps** tab selected, press the blue **Install** button:

 ![QRadar Functions for SOAR install](images/cp4s-app-install.png)

- This kicks off the **Install App Wizard**. Click on the blue **Select a file** button:

 ![QRadar Functions for SOAR install](images/app-upload-wizard.png)

- This prompts you to your local machines file browser where you will have to navigate to where the `app-fn_qradar_integrations-2.2.x-xxxxx.zip` was downloaded from your browser:

 ![QRadar Functions for SOAR install](images/app-upload.png)

 > **Note:**
 > 
 > The application version may have changed since the time of writing this document.
 >

- Once you have selected the file, you will need to upload the file by clicking the blue **Upload File** button:

 ![QRadar Functions for SOAR install](images/app-upload-completed.png)


- Upon successful upload, the **Install App Wizard** displays the *Package Information*. You then click the blue **Next** button to continue:

 ![QRadar Functions for SOAR install](images/app-upload-complate-package.png)

- The **Install App Wizard** next displays the *API Key Permissions* as well as the *Package Contents* before implementing the install. Click the blue **Install** button to continue:

 ![QRadar Functions for SOAR install](images/app-wizard-install.png)
 
- Upon successful installation, you should see a screen that resembles below:

 ![QRadar Functions for SOAR install](images/app-successful-installation.png)

 You are now ready to move on and cofigure the *QRadar Functions For SOAR* application by clickin the grey **Close** button.

---

### Step 4: *Configure QRadar Functions For SOAR Application*

- Once closed the **Install App Wizard** should bring you to the *Details* tab of the newly downloaded application. Click onto the *Configuration* tab:

 ![QRadar Functions for SOAR install](images/app-install-details.png)

- The *Configuration* tab should resemble the following:

 ![QRadar Functions for SOAR install](images/app-config-file.png) 
 
 Click on the `app.config` file to bring you to the *App Setting / app.config* screen.
 
- The *App Settings / app.config* page should resemble the following:

 ![QRadar Functions for SOAR install](images/app-config-details.png) 
 
 Scroll to the bottom so we can point our application to our *Edge Gateway*.

- To configure the *Edge Gateway* click the **Choose edge gateway** demonstrated below:

 ![QRadar Functions for SOAR install](images/app-config-edge-gateway.png)

- It should produce a menu drop-down with only one option. Select it.

 ![QRadar Functions for SOAR install](images/app-config-edge-gateway-menu.png)

 So it resembles this:
 
 ![QRadar Functions for SOAR install](images/app-config-edge-gateway-menu-complete.png)	
 > **Note:**
 >
 > Your *Edge Gateway* name may be different than the example. Regardless, you should only have one option. 
 >

-  Next, you need to modify the `app.config` file itself so that it points to what you are integrating with properly. You will need to modify the following fields for the **QRadar Functions For SOAR**:

 ![QRadar Functions for SOAR install](images/app-config-settings.png)

- Replace the first highlighted box so it resembles the following:
 
 ```bash
 [fn_qradar_integration:SOAR_Plugin_Destination_Name1]
 host = <replace-me-with-provided-qradar-ip>
 username = admin
 qradarpassword = Pass4Admin
 #Note, if both qradarpassword and qradartoken are given, password will be used
 #qradartoken = changeme
 verify_cert = false
 
 #Note: the QRadar instance name that you want to communicate with, must equal the
 #QRadar Destination Name that is set when configuring the SOAR Plugin
 #[fn_qradar_integration:SOAR_Plugin_Destination_Name2]
 #host = localhost
 #username = admin
 #qradarpassword = changeme
 #Note, if both qradarpassword and qradartoken are given, password will be used
 #qradartoken = changeme
 #verify_cert = false|/path/to/cert
 ```
- Replace the second highlighted box so that it resembles the following:
 
 ```bash
 cafile = false
 ```
 
- Last but not least, click the **Test Configuration** button. Upon successful completion, you should see the following:

 ![QRadar Functions for SOAR install](images/app-config-settings-test.png)
 
 
- Next, scroll up to the top of the screen and click the blue **Save and Push Changes** button for the settings to take effect on the newly deployed application.

 ![QRadar Functions for SOAR install](images/app-config-push-changes.png)
 
- After pushing those changes, you will be brought to the following screen:

 ![QRadar Functions for SOAR install](images/app-config-changes-successful.png)
 
 Click the *Details* tab to finish the application deployment process.
 
- Back at the *Details* tab of the application, press the grey **Deploy** button at the bottom:

 ![QRadar Functions for SOAR install](images/app-deployment.png)
 
-  This should then prompt the **Status** to change to *Deploying...* in the upper left corner:

 ![QRadar Functions for SOAR install](images/app-deployment-status.png)
 
- Upon successful deployment, the status will then change to *Ready For Use!*:

 ![QRadar Functions for SOAR install](images/app-ready-for-use.png)
 
- The **QRadar Functions For SOAR** Application is now successfully installed.

 ![QRadar Functions for SOAR install](images/app-install-complete.png)

---

### Step 5: *Download and Installing QRadar Enhanced Data Migration*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![QRadar Enhanced Data Migration install](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *QRadar Enhanced Data* which should give you the following screen below:
 
  ![QRadar Enhanced Data Migration install](images/app-exchange-qradar_edm.png)
  
  Click the app called **QRadar Enhanced Data Migration**.

> **Note:**
> 
> For complete steps on how to install the **QRadar Enhanced Data Migration**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 6: *Configure QRadar Enhanced Data Migration*

- Navigate to the *App Setting / app.config* page of the **QRadar Enhanced Data Migration**, click the *Configuration* tab and then the `app.config` file.

-  Modify the `app.config` file.

 ![QRadar Enhanced Data Migration install](images/app-config-settings.png)

- Replace the first highlighted box so it resembles the following:
 
 ```bash
 [fn_qradar_integration:SOAR_Plugin_Destination_Name1]
 host = <replace-me-with-provided-qradar-ip>
 username = admin
 qradarpassword = Pass4Admin
 #Note, if both qradarpassword and qradartoken are given, password will be used
 #qradartoken = changeme
 verify_cert = false
 
 #Note: the QRadar instance name that you want to communicate with, must equal the
 #QRadar Destination Name that is set when configuring the SOAR Plugin
 #[fn_qradar_integration:SOAR_Plugin_Destination_Name2]
 #host = localhost
 #username = admin
 #qradarpassword = changeme
 #Note, if both qradarpassword and qradartoken are given, password will be used
 #qradartoken = changeme
 #verify_cert = false|/path/to/cert
 ```
- Replace the second highlighted box so that it resembles the following:
 
 ```bash
 cafile = false
 ```

- Click the **Test Configuration** button then wait for the test to complete:

 ![QRadar Enhanced Data Migration install](images/app-config-settings-test.png)

-  Click the blue **Save and Push Changes** button in the upper right corner.

- Click the *Details* tab to finish the application deployment process.

- Press the grey **Deploy** button at the bottom.

- The **QRadar Enhanced Data Migration** Application is now successfully installed. 

> **Note:**
> 
> For complete steps on how to configure the **QRadar Enhanced Data Migration**, please refer to the previous **Step 4** of this guide.

---

### Step 7: *Download and Installing IBM SOAR Task Helper Functions Application* 

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![IBM SOAR Task Helper Functions install](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *tasks* which should give you the following screen below:
 
  ![IBM SOAR Task Helper Functions install](images/app-exchange-task-functions.png)
  
  Click the app called **IBM SOAR Task Helper Functions**.

> **Note:**
> 
> For complete steps on how to install the **IBM SOAR Task Helper Functions**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 8: *Configure IBM SOAR Task Helper Functions Application*

- Navigate to the *App Setting / app.config* page of the **IBM SOAR Task Helper Functions**, click the *Configuration* tab and then the `app.config` file.

-  Modify the `app.config` file.

 ![IBM SOAR Task Helper Functions install](images/app-config-settings-tasker.png)

- Replace the highlighted box so that it resembles the following:
 
 ```bash
 cafile = false
 ```

- Click the **Test Configuration** button then wait for the test to complete:

 ![IBM SOAR Task Helper Functions install](images/app-config-tasker-ignore.png)

 > **Note:**
 > 
 > The test fails but don't worry, it should still work for this lab. As noted, the self test was not implemented for this application.

-  Click the blue **Save and Push Changes** button in the upper right corner.

- Click the *Details* tab to finish the application deployment process.

- Press the grey **Deploy** button at the bottom.

- The **IBM SOAR Task Helper Functions** Application is now successfully installed. 

> **Note:**
> 
> For complete steps on how to configure the **IBM SOAR Task Helper Functions**, please refer to the previous **Step 4** of this guide.

---

### Step 9: *Download and Installing IBM SOAR Data Table Helper Functions*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![IBM SOAR Data Table Helper Functions](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *Data Table* which should give you the following screen below:
 
  ![IBM SOAR Data Table Helper Functions](images/app-exchange-datatable-functions.png)
  
  Click the app called **IBM SOAR Data Table Helper Functions**.

> **Note:**
> 
> For complete steps on how to install the **IBM SOAR Data Table Helper Functions**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 10: *Configure IBM SOAR Data Table Helper Functions*

- Navigate to the *App Setting / app.config* page of the **IBM SOAR Data Table Helper Functions**, click the *Configuration* tab and then the `app.config` file.

-  Modify the `app.config` file.

 ![IBM SOAR Data Table Helper Functions install](images/app-config-settings-datatable.png)

- Replace the highlighted box so that it resembles the following:
 
 ```bash
 cafile = false
 ```

- Click the **Test Configuration** button then wait for the test to complete:

 ![IBM SOAR Data Table Helper Functions install](images/app-config-datatable-test.png)

-  Click the blue **Save and Push Changes** button in the upper right corner.

- Click the *Details* tab to finish the application deployment process.

- Press the grey **Deploy** button at the bottom.

- The **IBM SOAR Data Table Helper Functions** Application is now successfully installed. 

> **Note:**
> 
> For complete steps on how to configure the **IBM SOAR Data Table Helper Functions**, please refer to the previous **Step 4** of this guide.

---

### Step 11: *Download and Installing Timer Function for SOAR*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![Timer Function for SOAR install](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *timer* which should give you the following screen below:
 
  ![Timer Function for SOAR install](images/app-exchange-timer-functions.png)
  
  Click the app called **Timer Function for SOAR**.

> **Note:**
> 
> For complete steps on how to install the **Timer Function for SOAR**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 12: *Configure Timer Function for SOAR*

- Navigate to the *App Setting / app.config* page of the **Timer Function for SOAR**, click the *Configuration* tab and then the `app.config` file.

-  Modify the `app.config` file.

 ![Timer Function for SOAR install](images/app-config-settings-timer.png)

- Replace the highlighted box so that it resembles the following:
 
 ```bash
 cafile = false
 ```

- Click the **Test Configuration** button then wait for the test to complete:

 ![Timer Function for SOAR install](images/app-config-timer-test.png)

-  Click the blue **Save and Push Changes** button in the upper right corner.

- Click the *Details* tab to finish the application deployment process.

- Press the grey **Deploy** button at the bottom.

- The **Timer Function for SOAR** Application is now successfully installed. 

> **Note:**
> 
> For complete steps on how to configure the **Timer Function for SOAR**, please refer to the previous **Step 4** of this guide.

---

### Step 13: *Download and Installing MITRE ATT&CK Integration for SOAR*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![MITRE ATT&CK Integration for SOAR install](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *att&ck* which should give you the following screen below:
 
  ![MITRE ATT&CK Integration for SOAR install](images/app-exchange-mitre-functions.png)
  
  Click the app called **MITRE ATT&CK Integration for SOAR**.

> **Note:**
> 
> For complete steps on how to install the **MITRE ATT&CK Integration for SOAR**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 14: *Configure MITRE ATT&CK Integration for SOAR*

- Navigate to the *App Setting / app.config* page of the **MITRE ATT&CK Integration for SOAR**, click the *Configuration* tab and then the `app.config` file.

-  Modify the `app.config` file.

 ![MITRE ATT&CK Integration for SOAR install](images/app-config-settings-mitre.png)

- Replace the highlighted box so that it resembles the following:
 
 ```bash
 cafile = false
 ```

- Click the **Test Configuration** button then wait for the test to complete:

 ![MITRE ATT&CK Integration for SOAR install](images/app-config-mitre-test.png)

-  Click the blue **Save and Push Changes** button in the upper right corner.

- Click the *Details* tab to finish the application deployment process.

- Press the grey **Deploy** button at the bottom.

- The **MITRE ATT&CK Integration for SOAR** Application is now successfully installed. 

> **Note:**
> 
> For complete steps on how to configure the **MITRE ATT&CK Integration for SOAR**, please refer to the previous **Step 4** of this guide.

---

### Step 15: *Download and Installing ServiceNow Functions for IBM SOAR Application*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![ServiceNow Functions for IBM SOAR install](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *snow* which should give you the following screen below:
 
  ![ServiceNow Functions for IBM SOAR install](images/app-exchange-snow.png)
  
  Click the app called **ServiceNow Functions for IBM SOAR**.

> **Note:**
> 
> For complete steps on how to install the **ServiceNow Functions for IBM SOAR**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 16: *Download and Installing LDAP and Active Directory Functions for SOAR*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![LDAP and Active Directory Functions for SOAR](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *ldap* which should give you the following screen below:
 
  ![LDAP and Active Directory Functions for SOAR](images/app-exchange-ldap.png)
  
  Click the app called **LDAP and Active Directory Functions for SOAR**.

> **Note:**
> 
> For complete steps on how to install the **LDAP and Active Directory Functions for SOAR**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

### Step 17: *Download and Installing CrowdStrike Falcon Insight and Threat Intel*

- Navigate to the IBM X-Force Exchange / App Exchange by clicking [here](https://exchange.xforce.ibmcloud.com/hub).

 ![CrowdStrike Falcon Insight and Threat Intel install](images/xforce-app-exchange-home.png)

- On the left hand side of the screen **Refine by** under **Brands** select **SOAR**. Then, in the *Search By Application* field, start typing *falcon insight* which should give you the following screen below:
 
  ![CrowdStrike Falcon Insight and Threat Intel install](images/app-exchange-crowdstrike.png)
  
  Click the app called **CrowdStrike Falcon Insight and Threat Intel**.

> **Note:**
> 
> For complete steps on how to install the **CrowdStrike Falcon Insight and Threat Intel**, please refer to the previous **Step 2** and **Step 3** of this guide.

---

## Data Tables

### Step 18: *Create the Data Table For LDAP Users*

- Click the icon in the upper left most corner of the screen to produce the main **Menu** drop down:
 
 ![Tech Bootcamp Lab Infrastructure](images/main-menu-dropdown.png)

- From there under *Application Settings*, select **Case Management** and then **Customization**:
 
 ![Tech Bootcamp Lab Infrastructure](images/case-management-customizations.png)

- At the **Customization  Settings**, under **New Incident Wizard**, select **Incident Tabs**:

 ![Tech Bootcamp Lab Infrastructure](images/incident-tabs.png)

- The **Incident Tabs** produces a drop down menu. Select **Artifacts**
 
 ![Tech Bootcamp Lab Infrastructure](images/incident-tab-artifact.png)

- Click the grey **Add Table** button to kick off the **Create Data Table** install wizard:

 ![Tech Bootcamp Lab Infrastructure](images/artifacts-add-table.png)

- For the *What is the label for this table?* field add: **LDAP Users**: 
 
 ![Tech Bootcamp Lab Infrastructure](images/create-table-name.png)
 
 Click the blue **Next** button to proceed.
 
 > **Note:**
 > The label name for the Data Table creates an *API Name* automatically in the field below it.
 >
 >

- For column names, add: **Username**, **Name**, **Job Title**, **Department**, **Email**, **Location**, **Manager**, and **Device ID** exactly as it appears below: 
 
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-names-1.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-names-2.png)

 Click the blue **Next** button to continue.
 
- The **Create Data Table** install wizard next takes you through *Configuring columns* 1 through 4. The only modification that we will be making to each column is adding *dt_* to the front of each API name (this is to avoid collisions in field names and data table names). After each change, just click the blue **Next** button: 
 
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-1.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-2.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-3.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-4.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-5.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-6.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-7.png)
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-8.png)

- Click the blue **** button to finish confirming the creation of the Data Table.
 
 ![Tech Bootcamp Lab Infrastructure](images/create-table-column-field-complete.png)

- The data table is now created and will be referenced shortly there after in the lab:

 ![Tech Bootcamp Lab Infrastructure](images/data-table-created-done.png)
 
---

## Phases and Tasks

### Step 19: *Create The Phases*

- Click the three horizontal line icon in the upper left corner which should produce a large drop down menu.

 ![Tech Bootcamp Lab Infrastructure](images/admin-settings-menu.png)

- In the menu drop down, select the label marked **Case Management** which will produce yet another drop down menu.

 ![Tech Bootcamp Lab Infrastructure](images/admin-settings-menu-case-management.png)

- Under the **Case Management** drop down, select **Customization** which will bring you to a new page:
 
 ![Tech Bootcamp Lab Infrastructure](images/admin-settings-menu-customizations.png)

- Once at the **Customization** page, you will then need to click on the **Phases & Tasks** tab:

 ![Tech Bootcamp Lab Infrastructure](images/admin-customizations.png)

- Next, click the grey **Create Phase** button to begin creating our own custom phases for this lab:

 ![Tech Bootcamp Lab Infrastructure](images/admin-customization-phases.png)

- Create a phase for *Discovery and Identification* then click the blue **Create** button:

 ![Tech Bootcamp Lab Infrastructure](images/admin-phase-discovery.png)

- Create a phase for *Enrichment and Validation* then click the blue **Create** button:

 ![Tech Bootcamp Lab Infrastructure](images/admin-phase-enrichment.png)

- Create a phase for *Containment and Remediation* then click the blue **Create** button:

 ![Tech Bootcamp Lab Infrastructure](images/admin-phase-containment.png)

- Create a phase for *Recovery and Communication* then click the blue **Create** button:

 ![Tech Bootcamp Lab Infrastructure](images/admin-phase-recovery.png)

- Once the phases have been created, you must rearrange them towards the top for priority:

 ![Tech Bootcamp Lab Infrastructure](images/admin-phase-rearrange.png)
 
 > **Note:**
 > 
 > The instructions are highlighted for how to rearrange the phases. 

- Implemented successfully, they should resemble this:

 ![Tech Bootcamp Lab Infrastructure](images/admin-phase-rearranged.png) 
 
 Now we are ready to create some Tasks.

---

### Step 20: *Create The Tasks*

- While still in the **Customization Settings** page, select the blue **Create Tasks** button.

 ![Tech Bootcamp Lab Infrastructure](images/admin-customization-tasks.png) 

- First, select the **Discovery and Identification** phase under the *Phase* drop down.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-discovery.png)

- Name the task next to the *Task Name* field: **Get MITRE ATT&CK Techniques**. Finally, add the below *instructions*:

>Use the "MITRE ATT&CK Integration for IBM SOAR" and corresponding technique ID to collect the following information about the incident:
>
>    MITRE Collection
>
>    - Tactic Name
>
>    - Technique ID
>
>    - Technique Name
>
>    - Technique References
>
>    - Technique Description
>
>    - Technique Detection
>
>
>Check to see that the results are displayed in the "MITRE ATT&CK Techniques" data table.
>

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-process.png)
 
 - Again Scroll down to the lower right corner of the screen. Under **Fields** scroll till you see the Fields named **MITRE ATT&CK Tactic ID**, **MITRE ATT&CK Tactic name**, **MITRE ATT&CK Technique ID**, and **MITRE ATT&CK Technique name**, then click, drag, and drop both into the large *Task Layout* section:

![Tech Bootcamp Lab Infrastructure](images/task-enrichment-field.png)

 - Scroll down to the lower right corner of the screen. Under **Data Tables** scroll till you see the Data Tables named **MITRE ATT&CK Tactics** and **MITRE ATT&CK Techniques**, then click, drag, and drop both into the large *Task Layout* section:
 
 ![Tech Bootcamp Lab Infrastructure](images/task-enrichment-data-table.png)

 - Move these around into the following order to match MITRE ATT&CK Framework.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-layout.png)

 Click the blue **Save & Close** button and continue.

- While still in the **Customization Settings** page, select the blue **Create Tasks** button.

 ![Tech Bootcamp Lab Infrastructure](images/admin-customization-tasks.png)

- Again, select the **Enrichment and Validation** phase under the *Phase* drop down.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-validation.png)

- Name this task next to the *Task Name* field: **Confirmation**. Also set the *Due Date* to **Yes** and **1 Hours** from **Date Task Initiated**. Finally, add the *Instructions* below and include **Incident Disposition** field in the *Task layout*:

> Based on the initial triage of the incident & the analysis of the artifacts, determine whether this is incident is a true offense or a false positive.
>Mark your findings in the field below.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-extract.png)

 Click the blue **Save & Close** button and continue.
 
- While still in the **Customization Settings** page, select the blue **Create Tasks** button.

 ![Tech Bootcamp Lab Infrastructure](images/admin-customization-tasks.png) 

- This time, select the **Containment and Remediation** phase under the *Phase* drop down.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-remediation.png)

- Name this task next to the *Task Name* field: **Open Service Now Incident**, then add the following *instructions*:

>Open a Service Now Ticket to have the System involved in this incident remediated.
>
> - For malware infected systems, this could be cleaned of any malware or re-imaged.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-snow.png)

 > **Warning:**
 > 
 > Make sure there are no trailing white spaces in the *Task Name* field or the **Task Utils: Close Task** Function will not work!

 Click the blue **Save & Close** button and continue.

- Finally for our final tasks, we are going to edit already existing tasks, so in the **Customization Settings** page, find the task **Analyze malware-infected systems** in the *Detect/Analyze* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-1.png)
 
- This time, change the Phase to **Discovery and Identification** phase under the *Phase* drop down and add the **LDAP Users** and **Crowdstrike Falcon Devices** data tables to the Task Layout. 

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-1.png)

 Click the blue **Save & Close** button and continue. 
 
- In the **Customization Settings** page, find the task **Analyze network traffic for malware activity** in the *Detect/Analyze* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-2.png)
 
- Change the Phase to **Discovery and Identification** phase under the *Phase* drop down and add the **QR Flows**, **Crowdstrike Falcon Devices**, **QR Destination IPs (First 10)**, and **QR Source IPs (First 10)** data tables to the Task Layout. 

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-2.png)

 Click the blue **Save & Close** button and continue.

 - In the **Customization Settings** page, find the task **Disconnect or isolate malware-infected systems** in the *Respond* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-3.png)
 
- This time, change the Phase to **Containment and Remediation** phase under the *Phase* drop down and add the **Crowdstrike Falcon Devices** data table to the Task Layout. 

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-3.png)

 Click the blue **Save & Close** button and continue.

 - In the **Customization Settings** page, find the task **Review the output and status of anti-virus software** in the *Detect/Analyze* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-4.png)
 
- This time, change the Phase to **Containment and Remediation** phase under the *Phase* drop down and add the **Crowdstrike Falcon Devices** data table to the Task Layout. 

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-4.png)

 Click the blue **Save & Close** button and continue.

- In the **Customization Settings** page, find the task **Apply type-specific malware containment measures** in the *Respond* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-5.png)
 
- This time, change the Phase to **Containment and Remediation** phase under the *Phase* drop down.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-5.png)

 Click the blue **Save & Close** button and continue.

 - In the **Customization Settings** page, find the task **Define and document malware eradication strategy** in the *Detect/Analyze* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-6.png)
 
- This time, change the Phase to **Recovery and Communication** phase under the *Phase* drop down.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-6.png)

 Click the blue **Save & Close** button and continue.

 - In the **Customization Settings** page, find the task **Recover each malware-infected system** in the *Detect/Analyze* Phase, and edit it using the pencil to the far right.

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-edit-7.png)
 
- This time, change the Phase to **Recovery and Communication** phase under the *Phase* drop down and add the **Crowdstrike Falcon Devices** data table to the Task Layout. 

 ![Tech Bootcamp Lab Infrastructure](images/admin-task-update-7.png)

 Click the blue **Save & Close** button and continue.

---

## Playbook Design: Create Your SOP Playbook

### Step 21: *Create Playbook Scope and Conditions*

- Click the three horizontal line icon in the upper left corner which should produce a large drop down menu: 

 ![Tech Bootcamp Lab Infrastructure](images/customization-menu.png)

- Click the menu item called **Case Management** which should produce yet another drop down menu:

 ![Tech Bootcamp Lab Infrastructure](images/customization-menu-case-management.png)

- In that drop down menu, you will see a menu item **Playbooks**. Click it to bring you to the **Playbook Designer** page.

 ![Tech Bootcamp Lab Infrastructure](images/customization-menu-playbook.png)

- At the **Playbooks** page, click the blue button **Create playbook** to begin creating our first playbook.

 ![Tech Bootcamp Lab Infrastructure](images/playbooks-page.png)

- Name the *Playbook*: **SOP: Malware** Then click the blue button **Create**.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-name.png)

- The canvas starts with the first node asking you to *Start by selecting an object type*. Under **Activation details** click the **Select an activation type** menu drop down:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-start-node.png)

- For this particular playbook we want to set *activation type* to **automatic**:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-automatic-activation.png) 

- Next, click the **Select an object type** menu drop down:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-object-type.png) 

- Since we want the scope of the playbook to run on an *Incident* level select **Incident** in the menu drop down:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-object-incident.png) 

- You should see the following:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-incident-activated-condition.png)

 Next, click the **Create condition** button.

- This will bring you to the *Create Condition* page with a default condition. Click the **Incident is created** menu drop down under *Condition builder*.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-create-condition.png)

- Under the drop down is also a search field. In it, begin typing *Incident Type* as seen below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-incident.png)

- This bolts on another lateral menu drop down. Change it to **is included within** as portrayed below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-incident-type.png)

- This then adds on a lateral multi-select field. Begin typing *Zero* into the field, select the **Malware** drop down option and then the blue **Done** button to finish creating our condition for our playbook.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-incident-type-malware.png)

- Now that our condition is set, we are now ready to create our playbook.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-set.png)  

---

### Step 22: *Adding Tasks, Scripts, and Decision Points*

- The Playbook begins with adding tasks to the canvas and attaching it to the starting node. Click on the icon that resembles a clip board on the left hand side depicted below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task.png)

 > **Note:**
 > 
 > Hovering the cursor over the icons tell you what each icon represents as displayed above. 
 
- This opens up the **Task** view which displays a list of phases. Click **Discovery and Identification** which produces a menu drop down:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-list.png)

- Next, click the **+** icon next to task called **Analyze malware-infected systems** which will then bring the task object to the canvas.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-add-process.png)

- This then adds the **Analyze malware-infected systems** Task as node to the canvas:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-process-added.png)

- Begin to rearrange the nodes similar to below by clicking and dragging them:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-rearrange.png)

 > **Note:**
 > 
 > When you click on a node you will see blue circles appear. It means that you can drag a connected line from one node to another. 
 >
  
- From one of the blue circles around whichever node you decide to click on, drag a connection line from node to another so that it resembles below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-connect-process.png)

- Now let's add the other 2 tasks from *Discovery and Indentification*, **Analyze network traffic for malware activity** and **Get MITRE ATT&CK Techniques**, and connect them from the *Incident activated* node.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-add-information-gathering.png)

- Close the **Task** menu:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-close-task-menu.png)

- Next, click on the icon that represents **Decision points** as shown below that will open up a menu view:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision.png)

-  Under the **Wait Point** section of the menu, select the **+** icon to add the **Wait Point** node to the canvas:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-wait.png)

- This then adds the **Wait Point** to the canvas:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-wait-added.png)

- Rearrange the **Wait Point** and then connect it to the **Analyze malware-infected systems** Task node:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-task-1.png)

- Then, connect the **Analyze network traffic for malware activity** Function node to the **Wait Point** node as shown below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-task-2.png)

- Finally, connect the **Get MITRE ATT&CK Techniques** Function node to the **Wait Point** node as shown below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-task-3.png)

- Close the **Decision points** menu:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-close.png)
 
- Click the **Task** icon again (the one that looks like a clipboard), and then **Enrichment and Validation** which displays a drop down menu:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-phase-enrichment.png)

-  Click the **+** button next to the Task that says **Confirmation**
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-add-confirm.png)

-  This will add the **Extract Findings From QRadar Offense** Task node to the canvas. Rearrange the Task node and connect it to the **Wait Point** node as shown below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-confirm-added.png)

 Close the **Task** menu.

- Again, click on the icon that represents **Decision points**. Once the menu opens, click the **+** icon associated with the **Condition point** which will then appear on canvas as shown:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-added-condition.png)

- Rearrange the **Condition point** and connect it to the Confirmation node as displayed below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-added-condition-rearranged.png)

- Name your *Condition point* **Incident Disposition**

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-condition-name.png)

- Create a *Condition* within your *Condition point* by clicking the blue **Create condition**

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-first-condition.png)

- Name your *Condition* **True Positive** as shown below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-name.png)

- Search the available fields for **Incident Disposition**:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-disposition.png)

- Set the value to be **is equal to** and **Confirmed**, saving this condition by clicking the blue **Done** button:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-true-positive.png)

- Close the **Decision Point** menu 

 ![Tech Bootcamp Lab Infrastructure](images/playbook-close-decision-point.png)

- Next, click on the icon that represents **Scripts** as shown below that will open up a menu view:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script.png)

- Click the **Create script** to start a new script for your playbook.
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-create.png)

- Because this script will likely get used within other playbooks, let's create this script as a **Global** scope and set the *Object type* as **Incident**.
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-config.png)

- Copy and Paste the following Python code into the *Code* section at the bottom of the *Create Script* page.

```py
if incident.confirmed == False:
  incident.resolution_id = "Not an Issue"
  incident.resolution_summary = "This was determined not to be an issue based on automated Resilient rules, and was closed."
  #This portion will take the original incident title and description and throw them to notes.
  #Because the IF statement implies a false positive finding, the title and description are changed to reflect that
  title = helper.createRichText(incident.name)
  desc = helper.createRichText(incident.description.content)
  falsePos = "<b>This incident was determined not to be an issue based on automated Resilient rules and was closed</b> <br> <br>The original title/name and description have been placed under Notes for record keeping."
  incident.addNote("Original Title/Name: " + title.content)
  incident.addNote("Original Description: " + desc.content)
  incident.name = "False Positive"
  incident.description = falsePos

Summ = ""
if incident.resolution_summary is not None:
  Summ = incident.resolution_summary
  incident.resolution_summary = Summ
else:
  incident.resolution_summary = principal.display_name + " has yet to provide the appropriate resolution information."

if incident.resolution_id != "Not an Issue":
  if not incident.resolution_id:
    incident.resolution_id = "Resolved"
incident.plan_status = "C"
```

 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-code.png)

- Once that the script is completed, click the blue **Create** button.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-complete.png)

- Add the script to the canvas by clicking the **+** button under *Automatic Close* script name.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-add.png)

- Rearrange the new script below the **Incident Disposition** *Condition point*. Then link the *Condition point* to the *Script* using the **else** path as shown below and choose **Save**:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-else.png)

- You can finally close out the **Script** window.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-close.png)

- Click the **Task** icon again (the one that looks like a clipboard). But this time click **Containment and Validation** which displays a drop down menu:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-containment.png)
 
- Click the **+** button next to the drop down option that says **Disconnect or isolate malware-infected systems**. 
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-added-containment.png)
 
- Rearrange the **Disconnect or isolate malware-infected systems** to the right of **Incident Disposition** and connect the Condition point node to the Task node using the **True Positive** path as shown below and click **Save**:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-isolate-connect.png)
 
- While still in the **Task** drop down menu **Containment and Remediation** Phase, Click the **+** button next to the drop down option that says **Open Service Now Incident**. Connect this task to the Isolate task.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-phase-snow.png)

- While still in the **Task** drop down menu **Containment and Remediation** Phase, Click the **+** button next to the drop down option that says **Apply type-specific malware containment measures**. Connect this task to the Isolate task as an additional path to **Open Service Now Incident**.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-phase-measures.png)

- While still in the **Task** drop down menu **Containment and Remediation** Phase, Click the **+** button next to the drop down option that says **Review the output and status of anti-virus software**. Connect this to the **Open Service Now Incident** task.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-phase-review.png)

- Next, while still in the **Task** drop down menu, click **Recovery and Communication**, then the **+** button next to the Task that says **Define and document malware eradication strategy** which then adds that Task node to the canvas as shown. We will link that to the **Apply type-specific malware containment measures** Task:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-phase-document.png)

- Close out the **Task** window.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-response-close.png)

- Under the **Decision point** section of the menu, select the **+** icon to add the **Wait Point** node to the canvas and rearrange it so that the 2 paths can be brought back together:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-wait-2.png)

- You can finally close out the **Decision point** window.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-close-2.png)

- Next, while still in the **Task** drop down menu, click **Recovery and Communication**, then the **+** button next to the Task that says **Recover each malware-infected system** which then adds that Task node to the canvas as shown. We will link that to the **Wait point** Decision point:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-recover.png)

- You can finally close out the **Task** window.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-close.png)

- Finally, link the task **Recover each malware-infected system** to the script **Automatic Close** as shown below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-script-link.png)

- Click the icon that represents the **Decision points** as shown below which will open up a menu view:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-decision-last.png)
 
- Click the **+** icon opposite the **End point** to add it to the canvas, then rearrange the **Endpoint** below the **Automatic Close** script and attach it:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-endpoint-add.png)

- Now we have completed the structure for our **SOP: Malware** Playbook. Here represents a birds eye view of our flow:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-process-complete.png)

---

### Step 23: *Saving and Enabling your Playbook*

- After completing the playbook build we have 1 final step, Save and Enable your playbook. Those can be done by choosing the options in the top right, **Save** with the save disk icon and then clicking the blue **Enable playbook** button:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-enable.png)

- Once your playbook has been *Enabled* you will see it change from a **draft** to **active**
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-draft.png)
 ![Tech Bootcamp Lab Infrastructure](images/playbook-enabled.png)

## Playbook Design: Create Your Integration Playbooks
 
### Step 24: *Build MITRE ATT&CK Integration Playbook*

- From the **Playbook** page, we start by clicking the blue **Create playbook  +** button in the right side of the screen: 
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-create-mitre.png)
 
- We need to give the playbook a name as done in a previous step. Add **Playbook: QRadar Ariel Query For Initial Findings** under the *Name* field then click the blue **Create** button at the bottom.
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-create-mitre-name.png)

- You are then brought to a Playbook canvas screen with an open **Activation Details** menu on the right. Click the **Select an activation type** under *Activation type* which will produce a drop down:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-canvas-activation-type.png)

- For this particular playbook we are creating, choose **Automatic** from the menu drop down.
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-activation-automatic.png)

- Next, click the **Select an object type** menu under *Object type* which will produce a drop down menu:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-object-type-select.png)

- The *Object type* drop down produces the following options, but since the scope of our playbook will be manually run on an *Task* level, we will be setting the *Object Type* to **Task** in the drop down:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-object-type-incident.png)

- You should then see that the starting node is set to **Task activated**. Next, click on the **Conditions** menu on the right as shown below:
  
 ![Tech Bootcamp Lab Infrastructure](images/playbook-incident-node-active.png)

- Once that Menu is open, click the **Create condition** button to determine when this playbook will run.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-create.png)

- Similar to how we built the conditions in our SOP Playbook, we will create 6 conditions that we will build out into an advanced logic. The first 2 conditions will be when **Task is created** and when the *task* **Name** value **is equal to** the task name **Get MITRE ATT&CK Techniques**.

>Note: Be sure to get the **TASK** name and **NOT** the **INCIDENT** name.

  ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-task-start.png)

- Next we will add the last 4 conditions which have to do with MITRE. We will set each of the *MITRE* fields, **MITRE ATT&CK Technique ID**, **MITRE ATT&CK Technique name**, **MITRE ATT&CK Tactic ID**, **MITRE ATT&CK Tactic name**, to the **has a value** comparitor as shown below:

  ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-task-end.png)

- Finally we will be adding an **Advanced** condition with the following condition.

> 1 AND 2 AND (3 OR 4) AND (5 OR 6)

  ![Tech Bootcamp Lab Infrastructure](images/playbook-condition-advanced.png)

- Once your condition is built then you can close the condition builder by selecting **Done**.

![Tech Bootcamp Lab Infrastructure](images/playbook-condition-completed.png)

- Next, you will click on the **Functions** icon as shown below:

![Tech Bootcamp Lab Infrastructure](images/playbook-functions.png)

- This will open a menu of available **Functions**. Click the one called **`fn_mitre_integration`** which will then produce a familiar drop down menu:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-functions-list.png)
 
- Click the **+** button next to the Function named **MITRE Tactic Information**

 ![Tech Bootcamp Lab Infrastructure](images/playbook-function-add-tactic.png)

- This then adds the **MITRE Tactic Information** Function as node to the canvas:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-function-tactic-added.png)

- Rearrange the function node as shown below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-function-rearrange.png)
 
- Connect the starting node to the **MITRE Tactic Information** Function node so it resembles similar to below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-function-connect-tactic.png)

- Next lets do the same thing, but this time with the **MITRE Tactic Information** to create a parallel path like what is pictured below.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-function-connect-technique.png)

- Close the **Function** window view:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-close-function-window.png)
 
- In the **MITRE Tactic Information** function, toggle the *Functions inputs* view to **Script** in the right pane.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-switch.png)

- For our script, we will add our input script logic for our **MITRE Tactic Information** Function with the following:

 ```py
if incident.properties.mitre_tactic_id:
  inputs.mitre_tactic_id = incident.properties.mitre_tactic_id
if incident.properties.mitre_tactic_name:
  inputs.mitre_tactic_name = incident.properties.mitre_tactic_name
 ``` 
 It should look similar to below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-tactic-input-script.png)

 Click the blue **Save** button to continue.

- All **Functions** require an output name whether it gets used or not. Name the *Output name*: `mitre_tactic_output` as shown below  

 ![Tech Bootcamp Lab Infrastructure](images/playbook-tactic-function-output.png)

- In the **MITRE Technique Information** function, toggle the *Functions inputs* view to **Script** in the right pane.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-switch_technique.png)

- For our script, we will add our input script logic for our **MITRE Technique Information** Function with the following:

 ```py
if incident.properties.mitre_technique_id:
  inputs.mitre_technique_id = incident.properties.mitre_technique_id
if incident.properties.mitre_technique_name:
  inputs.mitre_technique_name = incident.properties.mitre_technique_name
 ``` 
 It should look similar to below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-technique-input-script.png)

 Click the blue **Save** button to continue.

- All **Functions** require an output name whether it gets used or not. Name the *Output name*: `mitre_technique_output` as shown below  

 ![Tech Bootcamp Lab Infrastructure](images/playbook-technique-function-output.png)

- After the MITRE functions have been added, click on the icon shown below that represents **Decision points**:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decisions.png)

- Now add a **Wait Point** and connect the MITRE functions to it.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-decision-wait-mitre.png)

- Next, click the icon shown below that represents **Scripts**
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-object.png)

- This opens the **Scripts** view. Click the blue **Create script** button at the bottom of the screen as shown:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-create-script.png)

- This brings you to the **Create script** compiler user interface. Because this is a script likely only to be used within this playbook we will keep this script as a *Local* script, marked below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-mitre.png)

We will also add a name for our script: **MITRE Output Script**

- Add the following code:

 ```py
tactics = playbook.functions.results.mitre_tactic_output['content'].get('mitre_tactics')

for tactic in tactics:
  tactic_row = incident.addRow("mitre_attack_of_incident")
  tactic_row["collection"] = tactic["collection"]
  tactic_row["attack_tactic"] = tactic["name"]
  if not incident.properties.mitre_tactic_name:
    incident.properties.mitre_tactic_name = tactic["name"]
  tactic_row["tactic_code"] = tactic["id"]
  if not incident.properties.mitre_tactic_id:
    incident.properties.mitre_tactic_id = tactic["id"]
  url_html = '<a href="' + tactic["ref"] + '">' + tactic["ref"] + '</a><br>'
  tactic_row["reference"] = helper.createRichText(url_html)
  tactic_row["confidence"] = " "


att_techs = playbook.functions.results.mitre_technique_output['content'].get('mitre_techniques')

for att_tech in att_techs:
  tech_row = incident.addRow("mitre_attack_techniques")
  tech_row["collection"] = att_tech.get("collection", "")
  tech_row["tactic"] = att_tech.get("tactic", "")
  tech_row["technique_name"] = att_tech["name"]
  if not incident.properties.mitre_technique_name:
    incident.properties.mitre_technique_name = att_tech["name"]
  tech_row["technique_id"] = att_tech["id"]
  if not incident.properties.mitre_technique_id:
    incident.properties.mitre_technique_id = att_tech["id"]
  tech_row["technique_description"] = helper.createRichText(att_tech["description"])
  refs = att_tech["external_references"]
  ref_html = ""
  for ref in refs:
    ref_html = ref_html + '<a href="' + ref["url"] + '">' + ref["url"] + '</a><br>'
  tech_row["references"] = helper.createRichText(ref_html)
  tech_row["detection"] = helper.createRichText(att_tech["x_mitre_detection"])
 ```
 
 The script should resemble the following below:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-post-script.png)
 
 Click the blue **Create** button at the bottom right corner.
 
- Next, under the **Local script** drop down, click the **+** next to the **MITRE Output Script**:
      
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-add-mitre.png)

- This adds the **MITRE Output Script** Script node to the canvas as shown:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-script-canvas.png)

- Connect the **MITRE Output Script** Script node to the **Wait point** decision node.
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-connect-script.png)
 
- Next, we need to add 2 more functions to the canvas. Click the icon on the left that represents **Functions**:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-note.png)

- Under the **Functions** view click on **`fn_task_utils`** which creates a drop down menu. Click the **+** icon next to the Function named **Task Utils: Add Note** as shown:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-functions-task-note.png)

- This adds the **Task Utils: Add Note** Function node to the canvas which will need rearranged and connect the **Wait point** decision node to create a parallel path as shown:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-functions-parallel-note.png)

Click **Scripts** under *Function Inputs* on the right hand side.

- Next, we add the following lines of code:
 
 ```py
inputs.incident_id = incident.id
inputs.task_name = "Get MITRE ATT&CK Techniques"

inputs.task_utils_note_type = 'text'
inputs.task_utils_note_body = "MITRE information pulled from Qradar and Enhanced through MITRE ATT&CK automation. Closing Task Automatically."
 ``` 
 It should resemble this:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-add-task-note-code.png)
 
 Click the blue **Save** button at the bottom right corner.

- Name the *Output name* under **Function Output** on the right: **`add_note_output`**
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-note-output-name.png)

- Finally we add the last function, click the **+** icon next to the Function named **Task Utils: Close Task** as shown:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-functions-task-add.png)

- This again adds the **Task Utils: Close Task** Function node to the canvas which will need rearranged and connect the **Task Utils: Add Note** function node as shown:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-functions-note-close.png)

 Click **Scripts** under *Function Inputs* on the right hand side.

- Next, we add the following lines of code:
 
 ```py
inputs.incident_id = incident.id
inputs.task_name = "Get MITRE ATT&CK Techniques"
 ``` 
 It should resemble this:
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-add-task-code.png)
 
 Click the blue **Save** button at the bottom right corner.

- Name the *Output name* under **Function Output** on the right: **`close_task_output`**
 
 ![Tech Bootcamp Lab Infrastructure](images/playbook-task-output-name.png)
 
 Then on the left, click the icon that represents **Decision Points**

- In the **Decision points** view, add another **Wait point** to bring the paths back together like below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-final-wait-point.png)
 
- To wrap up this playbook, let's add the final node for every playbook, the **End point**.

 ![Tech Bootcamp Lab Infrastructure](images/playbook-end-point.png)

- The **End point** node will then be added to the canvas using the **+** and moved to the bottom of the playbook to be attached to the last **Wait point** node as shown below:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-endpoint-canvas.png)

 You can now close the **Decision Points** view.

- Make sure to save your changes by clicking the **Save** button in the upper right:

 ![Tech Bootcamp Lab Infrastructure](images/playbook-save-changes.png)

 Once the save is successful, click the blue **Enable playbook** button.

- Your MITRE Integration Playbook is now complete!
 
---

## Playbook Import: *Adding the Demo Automation*

Now that you know how to build playbooks, lets add the automations that will just be using scripts to demo system interactions.

### Step 25: *Importing the Final Playbooks*

- First we will need to download and unzip the 7zip file containing the additional playbooks from [here](demo_playbooks/Malware-Demo-Playbooks.7z).

- Next back in the *Playbooks* section, click the import playbook button just to the left of **Create playbook +**.

![Tech Bootcamp Lab Infrastructure](images/playbook-import.png)

> The following steps will need to be followed for **EACH** playbook in that zip file as you import a 1 playbook at a time.

- Select your first playbook to import into the system and upload it.

![Tech Bootcamp Lab Infrastructure](images/playbook-upload.png)

- Once you have selected a playbook to upload, you will see details about the playbook as shown below.

> Note:
>
> The notification circled in yellow can be ignored. This is just informing you that the app being used in this playbook is already installed and of same or newer versioning.
>
> Yes, playbooks can import apps automatically for you!

- To finish the import, just click the blue **Import** button.

![Tech Bootcamp Lab Infrastructure](images/playbook-upload-snow.png)

- Once the playbook has finished importing you will see the screen below which gives you the option of **Open Playbook*. For now we will just click the *X* and move on to the next playbook.

![Tech Bootcamp Lab Infrastructure](images/playbook-upload-snow-finish.png)

> Now repeat the steps above until you have imported in all of the playbooks in the zip file.

---

## Layout Design: Cleaning up your system

### Step 26: *Disabling Unused Rules*

- Click the icon in the upper left most corner of the screen to produce the main **Menu** drop down:
 
 ![Tech Bootcamp Lab Infrastructure](images/main-menu-dropdown.png)

- From there under *Application Settings*, select **Case Management** and then **Customization**:
 
 ![Tech Bootcamp Lab Infrastructure](images/case-management-customizations.png)

- When in the **Customization Settings**, select the **Rules** tab.

![Tech Bootcamp Lab Infrastructure](images/customization-rules.png)

- In the search bar, enter **Example**:

![Tech Bootcamp Lab Infrastructure](images/customization-rules-example-search.png)

- Toggle each of the rules listed from off to on to look like the image below:

![Tech Bootcamp Lab Infrastructure](images/customization-rules-example-off.png)

- Next, do the same thing for all **SNOW**, **MITRE**, and **Crowdstrike** Integration Rules as well.

![Tech Bootcamp Lab Infrastructure](images/customization-rules-snow-off.png)
![Tech Bootcamp Lab Infrastructure](images/customization-rules-mitre-off.png)
![Tech Bootcamp Lab Infrastructure](images/customization-rules-crowdstrike-off.png)

- Finally, turn off the cyber rules which are the default rules in the system

>**Note:**
>
>If you want to add these back as playbooks, I have converted them and are available [here](https://github.com/TheIRGurus/Playbooks/tree/main/Converted%20Default%20Playbooks). Just be careful with overlapping playbooks, check the conditions.

![Tech Bootcamp Lab Infrastructure](images/customization-rules-cyber-off.png)

You should now have cleaned up extra rules that will run or show up in menus that is not needed.

---

### Step 27: Redesigning your Incidents

> Note:
>
> This is not a mandatory step to get to the next. It was purely for aesthetic purposes.

- To change the over all layout of an incident, we must go into the **Customization Settings** by clicking the icon in the upper left most corner of the screen to produce the main **Menu** drop down:

 ![Tech Bootcamp Lab Infrastructure](images/main-menu-dropdown.png)

- From there under *Application Settings*, select **Case Management** and then **Customization**:
 
 ![Tech Bootcamp Lab Infrastructure](images/case-management-customizations.png)

- Then access the **Incident Tabs** by clicking the 2nd tab on the left marked **Incident Tabs**

 ![Tech Bootcamp Lab Infrastructure](images/customizations-layouts.png)

Once here we can discuss recommended updates.

- My first recommendation is that you combine some of the *Tabs* together to consolidate data, Like:

  - Notes and Attachments (and maybe Email)
  - Stats and Timeline (and maybe News Feed)

This can be done by using the **Manage Tabs** section to turn off all but one of the *Tabs* you are combining then moving the data from the other tabs to the visable one. Let me show you how to do that:

- First go into the **Manage Tabs** and choose 2 or more tabs to combine, I will go with Notes, Attachments, and Emails.

 ![Tech Bootcamp Lab Infrastructure](images/layout-manage-tabs.png)

- After making a decision which tab to keep, for this case I will keep the **Notes** tab, we will jump into the other 2 tabs and set them to not be visable.

> Notice on each tab when you set the *Tab Visible* to **No** the tab box grays out.

 ![Tech Bootcamp Lab Infrastructure](images/layout-manage-attachments.png)
 ![Tech Bootcamp Lab Infrastructure](images/layout-manage-email.png)

- Once the other 2 tabs are no longer visable, change the name on the **Notes** tab to help correlate the other tabs, in this instance we will name it *Notes & Attachments*:

 ![Tech Bootcamp Lab Infrastructure](images/layout-manage-notes.png)

Be sure to click the blue **Save** button after making these changes.

- Then we will used the Tab Layouts to the left to verify the data we need to move over to the combined tab.

 ![Tech Bootcamp Lab Infrastructure](images/layout-attachment-data.png)
 ![Tech Bootcamp Lab Infrastructure](images/layout-email-data.png)

- And finally add that data to the new combined tab by dragging and dropping the data to the right into the canvas designer in the middle.

![Tech Bootcamp Lab Infrastructure](images/layout-notes-data.png)

> Hint:
>
> When adding data to a layout be sure to check the color to the left of the data name as it will help you identify where to find it in the different types of data on the right.

- Feel free to add your own **Headers**, **HTML**, or **Section** *Blocks* to add to the look of the tab. 

![Tech Bootcamp Lab Infrastructure](images/layout-combine-data.png)

Finally be sure to click the blue **Save** button so you don't lose your work.

- My Next recommendation would be to create a new *Tab* for the MITRE Integration.

This can again be done by using the **Manage Tabs** section to **Add Tab** to the overall layout. Let's do that now:

- First let's jump back into the **Manage Tabs** section and select the box containing the **+**.

![Tech Bootcamp Lab Infrastructure](images/layout-new-tab.png)

- Now name the tab **`MITRE ATT&CK`** and click the blue **Add** button.

![Tech Bootcamp Lab Infrastructure](images/layout-new-name.png)

- After clicking **Add** you will be brought into the design canvas of the your new tab. Here we will add the MITRE *Fields* and *Data Tables* similar to how I did below by dragging and dropping from each data section:

![Tech Bootcamp Lab Infrastructure](images/layout-mitre-data.png)

Again be sure to click the blue **Save** button to not lose your work.

- The last recommendation I would include is to add the data tables that we created for this demo into the different sections as well.

First we will add the **LDAP Users** and **Crowdstrike Falcon Devices** tables to the **Artifacts** tab.

- Go to the **Artifacts** tab, and search for the **LDAP Users** and **Crowdstrike Falcon Devices** in the *Data Tables* data section, adding each one below the **Artifacts Widget**. Again making sure to **Save** when complete:

![Tech Bootcamp Lab Infrastructure](images/layout-artifacts-data.png)

Lastly we will add the **ServiceNow Records** table to the **Tasks** tab.

- Go to the **Tasks** tab, and scroll through the available *Data Tables* until you find **ServiceNow Records** then drag and drop it just below the **Task List Widget** as shown below. Finally **Save** your changes and you are set.

![Tech Bootcamp Lab Infrastructure](images/layout-tasks-data.png)

---

## Administrative Settings: *Setting up Workspaces and Groups*

In order to not get errors on certain parts of this demo. We must add a few things in the administrative settings.

### Step 28: *Adding Workspaces*

- Click the three horizontal line icon in the upper left corner of the screen which should produce a large drop down menu.

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-successful-login.png)

- The drop down menu should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-menu-dropdown.png)

 Click on **Case Management** which should produce yet another drop down menu.

- The drop down menu should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-case-management-menu-dropdown.png)
 
 Click on *Permissions and access* which will bring you to the **Administrator Settings**

- Lastly select the tab labeled **Workspaces** which should look like the following:

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-admin-workspaces.png)

- In order for you to add the shown **`Tier 1`** workspace, click the blue **Create Workspace** button.

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-admin-workspaces-new.png)

- Set the *Name of Workspace* to **Tier 1** and check the box making this the *Default Workspace*

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-admin-workspaces-tier1.png)

Then **Save & Close** to finish creating your new workspace.

> Feel free to add more workspaces for your demo environment, but this is the only one required.

---

### Step 29: *Establishing Teams*

- Next click on the *Groups* tab to get the following view.

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-groups.png)

> Similar to *Workspaces* you can add as many groups as you would like, but only the one I am about to show you is required.

- To add the **Tier 1 Analyst** group, click the blue **Create Group** button.

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-groups-new.png)

- Make the group *Name* **Tier 1 Analysts**, then give them the ability to own Incidents and Tasks as well as make them the *Default Incident Owner*

 > **Note:** The *Default Incident Owner* can only be assigned to 1 group so if making additional groups don't give them the *Default* option.

 ![Tech Bootcamp Lab Infrastructure](images/cp4s-groups-create.png)

 Then click the blue **Create** button to assign your new group.

 > Note:
 >
 > If you have multiple users in your demo environment, you may want to add them to your groups so you can use the **@** feature to tag other analysts in comments and assign them to tasks.

---

## QRadar Setup: *Configuring Plugins*

This demo requires 3 plugins in QRadar SIEM, **Analyst Workflow**, **Use Case Manager**, and **IBM QRadar SOAR**. For this demo, these are already installed for you, but you will need to configure **Use Case Manager** and **IBM QRadar SOAR**.

### Step 30: *Creating API Tokens/Keys*

- Once you authenticate with your QRadar SIEM, go to the **Admin** tab across the top.

![Tech Bootcamp Lab Infrastructure](images/qradar-admin.png)

- From here we will open the **Authorized Services** manager to setup the API Token for both **Use Case Manager** and **IBM QRadar SOAR**.

![Tech Bootcamp Lab Infrastructure](images/qradar-admin-services.png)

- In the pop-up window, click the Blue **+ Add** button to create a new API Token.

![Tech Bootcamp Lab Infrastructure](images/qradar-token-add.png)

- Add a **Label** and set the permissions to **Admin** for *Security Profile* and *User Role*. Then we will turn off the Token expiration date by toggling the switch.

![Tech Bootcamp Lab Infrastructure](images/qradar-token-permissions.png)

Save the new Token by clicking the blue **Save** button.

- Be sure to save the Token out somewhere save as after clicking **Close** button you will not be able to see the token again.

![Tech Bootcamp Lab Infrastructure](images/qradar-token-copy.png)

> **Note:** Do this one more time for SIEM to SOAR.

- Now we need to log into XDR to create API Keys. From the dashboard click the **Menu** icon in the top left.

![Tech Bootcamp Lab Infrastructure](images/cp4s-successful-login.png)

- From the menu panel, click the **Permissions and access**.

![Tech Bootcamp Lab Infrastructure](images/cp4s-case-management-menu-dropdown.png)

- After entering the *Administrator Settings*, you will be in the *Users* Tab This tab has a sub-tab called **API Keys** shown below. Click the sub-tab to view available keys.

![Tech Bootcamp Lab Infrastructure](images/admin-apikeys.png)

- To create a new API Key, click the blue **Create API Key**

![Tech Bootcamp Lab Infrastructure](images/admin-create-key.png)

- In the pop-up for creating a new API, Provide a Name to identify the key and give it *All Permissions*. At the very bottom of that pop-up click the **Create** button.

![Tech Bootcamp Lab Infrastructure](images/admin-create-permissions.png)

Save the **API Key ID** and **API Key Secret** on the next page as after you click **OK** you will not be able to see it again.

---

### Step 31: *Enabling Use Case Manager Plugin*

- Open the **Use Case Manager** by selecting the tab.

![Tech Bootcamp Lab Infrastructure](images/qradar-ucm.png)

- When **Use Case Manager** hasn't been setup yet you will see the screenshot below, Click the link to the *Admin configuration page*.

![Tech Bootcamp Lab Infrastructure](images/qradar-ucm-config.png)

- To enable, just enter in the Token created in [Step 30](#step-30-creating-api-keys) and click the blue **Submit** button.

![Tech Bootcamp Lab Infrastructure](images/qradar-ucm-settings.png)

Now **Use Case Manager** is ready to be used. Just go back to the **Use Case Manager** tab.

---

### Step 32: *Configuring IBM QRadar SOAR Plugin*

- To access the *IBM QRadar SOAR Plugin* configuration, start by going to the **Admin** tab.

![Tech Bootcamp Lab Infrastructure](images/qradar-admin.png)

- From there navigate to the *IBM QRadar SOAR Plugin* under the *Apps* section off to the left.

![Tech Bootcamp Lab Infrastructure](images/qradar-admin-apps.png)

- Access the SOAR configuration by clicking the **Configuration** icon.

![Tech Bootcamp Lab Infrastructure](images/qradar-admin-soar.png)

- Under the Access Tab, use the information below to establish the connection to SOAR from SIEM.

> QRadar Destination Name = {{ DO NOT CHANGE }}
> Authorized Service Token = {{ QRadar Token Created in first part of [Step 30](#step-30-creating-api-tokenskeys) }}
>
> SOAR Server URL = https://{{ Hostname of XDR }}
>
> CP4S mode = True

> REST URL = https://cases-rest.{{ Hostname of XDR }}
>
> STOMP Host = cases-stomp.{{ Hostname of XDR }}
>
> STOMP Port = 443
>
> Authentication Method = API key
>
> API Key ID = {{  }}
>
> API Key Secret = {{ SOAR API Key created in second part of [Step 30](#step-30-creating-api-tokenskeys) }}
>
> Multiple Organization Support = False
>
> Organization Name: {{ XDR Account management ID }}

> SOAR Timeout (seconds) = 30
>
> Connect Securely = False
>
> Enable Configuring SOAR = True
>
> Need to configure a proxy = False

![Tech Bootcamp Lab Infrastructure](images/qradar-soar-config-1.png)
![Tech Bootcamp Lab Infrastructure](images/qradar-soar-config-2.png)

Once the config has been entered click the **Verify and Configure**

- After you have received the *Verified Successfully* message, select **Save** to lock in your config.

![Tech Bootcamp Lab Infrastructure](images/qradar-soar-verified.png)

- Next we will set the *Syncronization* settings under the *Preferences* tab. Check all of the boxes shown below and fill in the following info for *Map SOAR Fields Required on Closing*:

> Resolution = Resolved
>
>Resolution Summary = Incident Resolved in QRadar

![Tech Bootcamp Lab Infrastructure](images/qradar-soar-preferences.png)

> **Note:**
>
> When checking the *Close Offense when Case closes* you should get an error stating that a list of Close Reasons don't exist in QRadar. We will need to add each one of those Close Reasons individually to QRadars **Custom Offense Close Reasons** in QRadars **Admin** tab shown below:

![Tech Bootcamp Lab Infrstructure](images/qradar-admin-reasons.png)

- Once the error above has been taken care of, hit the **Save** button one more time.

- Lastly, we need to import the Malware template to the plugin. This is done using the **Upload a Template** option in the **Escalation** tab.

![Tech Bootcamp Lab Infrastruture](images/qradar-soar-escalation.png)

- Simply download the Malware template [here](demo_plugin_templates/Malware). Then upload it using **Browse** and click the blue **Upload** button.

![Tech Bootcamp Lab Infrastructure](images/qradar-soar-malware.png)

You should now have everything you need to put it all together.

---

<!--
# *Part II: The Implementation*

## Putting It All Together

Now that your setup is complete, you will be expected to present this demo in front of the class and for customers.

### Step 33: *Escalate QRadar Offense to Cases*

- Start in your **QRadar SIEM** `v7.5` instance. 

 ![Tech Bootcamp Lab Infrastructure](images/qradar-box.png)

 It should already have **IBM Security QRadar Analyst Workflow** installed:

 ![Tech Bootcamp Lab Infrastructure](images/qradar-analyst-workflow.png)

 And there should already be **Offenses** populated:

 ![Tech Bootcamp Lab Infrastructure](images/qradar-offenses.png)

 > **Note**
 > 
 > If it throws a 404 Error, just click the **toggle menu** button in the upper left corner (known to some of you as the *hamburger button* and select the **Offenses** from the drop down directly.

- Choose an Offense at the top by clicking the check box as shown. 

 ![Tech Bootcamp Lab Infrastructure](images/qradar-select-offense.png)

 Then click the blue button called **Actions** which will produce a drop down.

- In the drop down, select the **Send to SOAR** option:
 
 ![Tech Bootcamp Lab Infrastructure](images/qradar-select-action.png)

- This will produce a **Send Case To SOAR** window with a menu drop down that says **Choose a template**. Click it: 

 ![Tech Bootcamp Lab Infrastructure](images/qradar-send-to-soar-template.png)

- Choose the option in the drop down that says **`Malware`**

 ![Tech Bootcamp Lab Infrastructure](images/qradar-select-template.png)
 
- Once you choose the correct template option, click the blue **Send** button:

 ![Tech Bootcamp Lab Infrastructure](images/qradar-selected-send.png)

- This will produce a hyperlink that says something to the effect of **Case has been created for Offense x**. Click that link which will then bring you to the open *Case* that launches the investigation.

 ![Tech Bootcamp Lab Infrastructure](images/qradar-soar-hyperlink.png)
 
---

### Step 34: *Automatic Process Playbook Invoked*

- Once in the case, you will land on the *Details* page of the **Case**:

 ![Tech Bootcamp Lab Infrastructure](images/case-details.png)
 
 Click on the *Artifacts* tab next.
 
 > **Note**
 > 
 > Feel free to click around and look at other details of the case.

- In the *Artifacts* table, note the data that was automatically carried over from the **QRadar Offense** and from Automated looking using LDAP and Crowdstrike.

 ![Tech Bootcamp Lab Infrastructure](images/case-artifacts.png)

 Next, click on the *Task* tab.
 
- Under the *Task* view, notice the **Process Playbook** already at work having already completed the **Process QRadar Offense** and **Extract Findings From QRadar Offense** Tasks.  

 ![Tech Bootcamp Lab Infrastructure](images/case-tasks.png)

 Now you are ready to conduct the next task in your investigation.

---

### Step 35: *Perform QRadar Search For Device ID*

- The outstanding task under the *Enrichment and Validation* phase is to **Perform Arial Query For Device ID**. Click on the blue **Actions** button in the upper right corner and select **Playbook: QRadar Ariel Query For Initial Findings**:  

 ![Tech Bootcamp Lab Infrastructure](images/case-qradar-search-action.png)

- You will then be brought to the following dialogue:  

 ![Tech Bootcamp Lab Infrastructure](images/case-qradar-search-action-dialogue.png)
 
 Click the blue **Confirm** button to continue.

- You should see a white banner at the bottom stating that the playbook was executed successfully. Click the task on the outstanding task named **Perform Arial Query For Device ID** to open the task itself and obverve the query results:

 ![Tech Bootcamp Lab Infrastructure](images/case-qradar-search-close-dialogue.png)

- While in the *Task*, you will see the results of the Ariel Query below:  
 
 ![Tech Bootcamp Lab Infrastructure](images/case-query-results-task.png)
 
 > **Note**
 > 
 > The Query results are from the past 25 days (at the time when this document was created) There are a lot of results and it may take a while to complete.
 >

---

### Step 36: *Isolate Host From Newly Found Device ID*

- The next outstanding task under the *Containment and Remediation* phase is to **Isolate Host on ReaQta Hive**. Click the outstanding task: 
 
 ![Tech Bootcamp Lab Infrastructure](images/case-reaqta-isolate-task.png)

- Once in the task, you should again see the same data table results from the QRadar Ariel Query:

 ![Tech Bootcamp Lab Infrastructure](images/case-reaqta-qradar-results.png)

- To perform the action of isolating the host passing in the Device ID, click the vertical three dots at the end of the first row of the data table as shown which will produce a drop down item called **Playbook: ReaQta Isolate Host Machine**. Select it:
 
 ![Tech Bootcamp Lab Infrastructure](images/case-reaqta-isolate-action.png)
 
 Click the *Notes* tab to see the results of running the playbook.
 
- The results of the **Playbok: ReaQta Isolate Host Machine**, if successful, will resemble the following below

 ![Tech Bootcamp Lab Infrastructure](images/case-reaqta-isolated.png)


 > **Note**
 > 
 > The results will not render instantaneously and will require a screen refresh
 >
 
---

### Step 37: *Create A Ticket In Service Now*

- The last outstanding task under the *Recovery and Communication* phase is to **Service Now: Report to Operations Team On Actions That Were Taken**. Since we are running this integration on a *Task* level, instead of clicking into the task, click the three vertical dots to right as show below:

 ![Tech Bootcamp Lab Infrastructure](images/case-snow-task.png)

- This will bring up a menu prompt with a list of actions. Click the one that says **SNOW:Create Record[Task]**:

![Tech Bootcamp Lab Infrastructure](images/case-snow-task-create.png)

- This will bring up a menu input field:

 ![Tech Bootcamp Lab Infrastructure](images/case-snow-task-action-input.png)
 
 > **Note**
 > 
 > You can set the **SN Assignment Group** field to whomever you'd like.
 >
 
- Add some comments to your "imaginary" Operations Team in the **SN Initial Note** text field. Then click the blue **Execute** button.

 ![Tech Bootcamp Lab Infrastructure](images/case-snow-task-action-input-add.png)

 > **Note**
 > 
 > You can put whatever comments you'd like to in the **SN Initial Note** text field that are relevant to your Ops Team.
 >
 
- The should see that the name of the task has changed, creating a Service Now record number in front of the Task name.

 ![Tech Bootcamp Lab Infrastructure](images/case-snow-task-name-change.png)

 > **Note**
 > 
 > This may take a couple of minutes for it to work, be patient.
 >

 Once the name has changed, click into the Task itself.

- Once inside the Task view, click the *Notes* tab:

 ![Tech Bootcamp Lab Infrastructure](images/case-snow-task-view-note.png)

- From within the *Notes* tab, you will see that you have both the **ServiceNow ID** as well as the **ServiceNow Link** that will talk you directly to the ServiceNow instance.
 
 ![Tech Bootcamp Lab Infrastructure](images/case-snow-task-note-record.png)
 
 > **Note**
 > 
 > The credentials to the SNOW instance are found in the app.config file of the SNOW Application in **Step: 10**.
 >
 
 Click the grey **Complete and Close** button in the upper right corner.

- Congratulations, you have finished triaging your alert! 

 ![Tech Bootcamp Lab Infrastructure](images/complete.png)

---

-->

# Part II: Bonus Demo Fun

## Improving the Demo

If you have got this far in the demo building exercise and there is still time, try to add to the demo with additional playbooks or info.

### Step 33: Add Additional Content to the Demo

- At this point you have completed the demo exercise, but now I have a challenge for you. Work on improving this demo or adding to is.

  - [Here](https://github.com/TheIRGurus) is a link to **The IR Gurus** *Github* page where you can find additional playbooks that could be added to the system and/or scripts that give you ideas how to add new functionality to your automation.

  - [Here](https://www.youtube.com/@theirgurus) is a link to **The IR Gurus** *YouTube* page where you can find instructional videos of how to do different things within the platform from customizing it, using integrations, building playbooks, and building your own integrations.

- We look forward to seeing your demos as well as what you have come up with!

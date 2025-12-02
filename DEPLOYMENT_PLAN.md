# DocFab Journal - Production Deployment Plan

**Created:** December 1, 2025  
**Last Updated:** December 2, 2025  
**Target Environment:** Production (`mt@dinfamiliejurist.dk`)  
**Source Environment:** Sandbox (`mt@dinfamiliejurist.dk.itdevops`)

---

## 🚦 CURRENT STATUS (December 2, 2025)

### ✅ COMPLETED PHASES

| Phase | Description | Status | Date |
|-------|-------------|--------|------|
| Phase 1 | Custom Metadata Types | ✅ DEPLOYED | Dec 1 |
| Phase 2 | Custom Permissions | ✅ DEPLOYED | Dec 1 |
| Phase 3 | Custom Metadata Records | ✅ DEPLOYED | Dec 1 |
| Phase 4 | Permission Sets & Groups | ✅ DEPLOYED | Dec 1 |

### 🔄 IN PROGRESS

| Phase | Description | Status | Blocker |
|-------|-------------|--------|---------|
| Phase 5 | Apex Classes | ⚠️ BLOCKED | Test coverage requirement |
| Phase 6 | Lightning Components | ⏳ WAITING | Depends on Phase 5 |

### 📊 Test Fix Progress

We discovered Production had **90 failing tests** (out of 652 total) that were pre-existing issues unrelated to our deployment. We've been fixing these to enable deployment.

**Test Fixes Deployed:**
- ✅ Phase 1 test fixes deployed (26 test classes) - Dec 2
- ⏳ Phase 2 test fixes (Lead conversion tests) - BLOCKED

**Test Classes Successfully Fixed & Deployed:**
- `AgentReport_Controller_Test` - Company__c validation
- `ChatServiceQuickTest` - Phone number format
- `DFJ_checkDuplicacy_Test` - Market_Unit__c value
- `DFJ_EventHandler_Test` - Market_Unit__c value
- `DFJ_HandleEventCampaignStatusTest` - Market_Unit__c value
- `DFJ_JournalFormConfiguration_Test` - Market_Unit__c value
- `DFJ_MembershipTriggerHandler_Test` - No changes needed
- `DFJ_PaymentCreatorForOpportunity_Test` - Market_Unit__c value
- `DFJ_ProductSelectorController_Test` - Product_Identifier__c length
- `DFJ_ProductSelectorForOpportunity_Test` - Product_Identifier__c length
- `DFJ_TestDataFactory` - Lead data fixes
- `DFJ_UpdateCallHistoryMarketUnit_Test` - Market_Unit__c value
- `DFJ_UpdateDuplicateLeadController_Test` - Company__c, Market_Unit__c
- `DocShare_JournalCreds_Test` - Market_Unit__c value
- `DocShareService_Tests` - Market_Unit__c value
- `ITSupportCenterController_Test` - Market_Unit__c value
- `McSmsFlowEnqueue_Test` - Phone format, Record_ID__c
- `McSmsSendQueue_Test` - Phone format, Record_ID__c
- `McSmsStatusPoller_Test` - Phone format, Record_ID__c
- `PS_PaymentService_Test` - Company__c validation
- `PS_InvoiceWebhookReceiver_Test` - Company__c validation
- `PS_TestDataFactory_Test` - Company__c validation
- `SDCallCampaignStateCreation_Test` - Market_Unit__c value
- `SMSTriggerTest` - Phone format, Record_ID__c
- `TelegentaOutcomeHelper_Test` - Market_Unit__c value
- `TestGettingNextLead` - Market_Unit__c, OwnerId

---

## 🚧 CURRENT BLOCKER: Lead Conversion Tests

### Problem Description

The `DFJ_ConvertLeads_Test` and `LeadConverterClassTest` fail with:
```
INVALID_STATUS, invalid convertedStatus: Converted: [Status]
```

### What We've Tried

1. ✅ Disabled Flow `BS_Lead_Throw_Error_when_Status_is_Changed_on_Converted_Lead`
2. ✅ Changed hardcoded 'Converted' status to query from LeadStatus
3. ✅ Added proper Company__c = 'Din Familiejurist ApS'
4. ✅ Added OwnerId = UserInfo.getUserId() (Leads owned by Queue can't convert)
5. ✅ Added RecordTypeId (DFJ_DK) and Market_Unit__c ('DFJ_DK')
6. ✅ Tried both 'Converted' and 'Qualified' as converted status values

### What We Know

- Production has 2 valid LeadStatus records with `IsConverted = true`:
  - 'Converted' (SortOrder: 5)
  - 'Qualified' (SortOrder: 7)
- Both statuses exist but the conversion API rejects them
- The error occurs at `Database.convertLead()` in `DFJ_ConvertLeads.convertLead()`

### What We DON'T Understand

- Why both 'Converted' and 'Qualified' fail as converted status despite `IsConverted = true`
- Whether there's a Lead Status Path restriction in Production
- Whether there's a Process Builder or Trigger interfering
- Whether the Lead needs to be in a specific status BEFORE conversion

### Active Validation Rules on Lead

| Rule | Description |
|------|-------------|
| `Cannot_Unconvert_Lead` | Prevents unconverting leads |
| `Enforce_Correct_RecordType_to_MarketUnit` | RecordType must match Market_Unit__c |
| `Prevent_Uncheck_Was_TM` | Was TM can't be unchecked |
| `Prevent_Removing_Communication_Ban` | Communication Ban can't be removed |

### Next Steps to Investigate

1. Check if there's a Lead Status Path restriction by RecordType
2. Check for any Process Builder on Lead that might interfere
3. Try creating and converting a Lead manually in Production
4. Check if LeadConverterClass (already in Production) works differently

---

## 📋 DEPLOYMENT OVERVIEW

This deployment introduces a **two-tier permission-based DocFab selection system** that allows:
- Permission-controlled access to different journal types (Record Models)
- Permission-controlled access to different form views within each journal type
- Country-specific access control via Custom Permissions
- A new LWC component for Account-based journal creation

---

## 🗂️ COMPONENTS TO DEPLOY

### Phase 1: Foundation (Custom Metadata Types)
> **Deploy first** - These are the building blocks. Deploying these has NO functional impact until Apex and LWC are updated.

| Component Type | Component Name | Status in Production | Action |
|----------------|----------------|---------------------|--------|
| **Custom Metadata Object** | `DocFab_Record_Model__mdt` | ❌ Does NOT exist | CREATE |
| **Custom Metadata Object** | `DocFab_Form__mdt` | ❌ Does NOT exist | CREATE |

**Custom Metadata Object Fields - `DocFab_Record_Model__mdt`:**
- `Record_Model_Id__c` - Text (External Key)
- `Custom_Permission__c` - Text (Links to Custom Permission API name)
- `Description__c` - Long Text Area
- `Field_Configuration__c` - Long Text Area (JSON field mapping)
- `Address_Configuration_Fields__c` - Long Text Area
- `Icon__c` - Text (SLDS icon name)
- `Page_Layout_Label__c` - Text (Display label)
- `Journal_Object__c` - Text

**Custom Metadata Object Fields - `DocFab_Form__mdt`:**
- `Record_Model__c` - Metadata Relationship (→ `DocFab_Record_Model__mdt`)
- `Form_Number__c` - Number (External Key)
- `Form_UUID__c` - Text (DocFab form identifier)
- `Custom_Permission__c` - Text (Links to Custom Permission API name)
- `Icon__c` - Text (SLDS icon name)
- `Page_Layout_Label__c` - Text (Display label)

---

### Phase 2: Custom Permissions
> **Deploy after Phase 1** - These control access to Record Models and Forms.

#### Record Model Custom Permissions (5 total):
| DeveloperName | Label | Description |
|--------------|-------|-------------|
| `DocFab_Record_Model_160_DK_Inheritance` | DocFab Record Model 160 (DK Inheritance) | Denmark inheritance (DFJ_DK market unit) |
| `DocFab_Record_Model_218_IE_Inheritance` | DocFab Record Model 218 (IE Inheritance) | Ireland inheritance |
| `DocFab_Record_Model_122_SE_Inheritance` | DocFab Record Model 122 (SE Inheritance) | Sweden inheritance (FA_SE market unit) |
| `DocFab_Record_Model_63_SE_Inheritance` | DocFab Record Model 63 (SE Inheritance) | **Deprecated** Sweden inheritance |
| `DocFab_Record_Model_230_DK_Pension` | DocFab Record Model 230 (DK Pension) | Denmark Pension (DFJ_DK market unit) |

#### Form Custom Permissions (6 total):
| DeveloperName | Label | Description |
|--------------|-------|-------------|
| `DocFab_Form_51_DK_Inheritance` | DocFab Form 51 (DK Inheritance) | Default Danish advisor form (Nov 2025) |
| `DocFab_Form_29_DK_Inheritance` | DocFab Form 29 (DK Inheritance) | **Deprecated** Danish advisor form |
| `DocFab_Form_17_SE_Inheritance` | DocFab Form 17 SE Inheritance | Default Swedish advisor form (Nov 2025) |
| `DocFab_Form_11_SE_Inheritance` | DocFab Form 11 (SE Inheritance) | **Deprecated** Swedish advisor form |
| `DocFab_Form_34_IE_Inheritance` | DocFab Form 34 (IE Inheritance) | Default Irish advisor form (Nov 2025) |
| `DocFab_Form_53_DK_Pension` | DocFab Form 53 (DK Pension) | DK Pension form |

---

### Phase 3: Custom Metadata Records
> **Deploy after Phase 2** - Configuration records defining Record Models and Forms.

#### Record Model Records (5 total):
| DeveloperName | Record Model ID | Custom Permission | Page Layout Label |
|--------------|-----------------|-------------------|-------------------|
| `Inheritance_Denmark_160` | 160 | `DocFab_Record_Model_160_DK_Inheritance` | Denmark Inheritance |
| `Inheritance_Ireland_218` | 218 | `DocFab_Record_Model_218_IE_Inheritance` | Ireland Inheritance |
| `Inheritance_Sweden_122` | 122 | `DocFab_Record_Model_122_SE_Inheritance` | Sweden Inheritance |
| `Inheritance_Sweden_63` | 63 | `DocFab_Record_Model_63_SE_Inheritance` | Sweden Inheritance (Old) |
| `Pension_DK_Pension_230` | 230 | `DocFab_Record_Model_230_DK_Pension` | Pensionsjournal |

#### Form Records (6 total):
| DeveloperName | Form # | Form UUID | Parent Record Model | Page Layout Label |
|--------------|--------|-----------|---------------------|-------------------|
| `Denmark_Inheritance_51` | 51 | `d4c87213-eb57-4dfc-b082-1735a75d7399` | `Inheritance_Denmark_160` | Denmark Inheritance |
| `Denmark_Inheritance_29` | 29 | `b8f8ad46-6fc7-4589-9112-9601c593de9b` | `Inheritance_Denmark_160` | Denmark Inheritance (Deprecated) |
| `Sweden_Inheritance_17` | 17 | `7c344693-7d12-43ce-9efc-727bc0f27402` | `Inheritance_Sweden_122` | Sweden Inheritance |
| `Sweden_Inheritance_11` | 11 | `5fd7478b-aa86-4fa3-b653-4388f5bb9c5f` | `Inheritance_Sweden_63` | Sweden Inheritance (Deprecated) |
| `Ireland_Inheritance_34` | 34 | `3ef69946-9695-46d6-9404-ef62f4daf896` | `Inheritance_Ireland_218` | Ireland Inheritance |
| `DK_Pension` | 53 | `0b94fca8-41bc-45f1-babf-1e10fe06f7cb` | `Pension_DK_Pension_230` | DK Pension |

---

### Phase 4: Permission Sets (13 total)
> **Create in Production** after Phase 2 is deployed. Can be deployed via metadata or created manually.

#### Admin Permission Set:
| Name | Label | Purpose |
|------|-------|---------|
| `DocFab_Record_Model_Form_Administrator` | DocFab Record Model & Form Administrator | Full access to all Record Models and Forms |

#### Record Model Permission Sets (5):
| Name | Label | Custom Permission Included |
|------|-------|---------------------------|
| `PS_DocFab_RM_160` | PS-DocFab-RM-160 | `DocFab_Record_Model_160_DK_Inheritance` |
| `PS_DocFab_RM_218` | PS-DocFab-RM-218 | `DocFab_Record_Model_218_IE_Inheritance` |
| `PS_DocFab_RM_122` | PS-DocFab-RM-122 | `DocFab_Record_Model_122_SE_Inheritance` |
| `PS_DocFab_RM_63` | PS-DocFab-RM-63 | `DocFab_Record_Model_63_SE_Inheritance` |
| `PS_DocFab_RM_230` | PS-DocFab-RM-230 | `DocFab_Record_Model_230_DK_Pension` |

#### Form Permission Sets (6):
| Name | Label | Custom Permission Included |
|------|-------|---------------------------|
| `PS_DocFab_Form_51` | PS-DocFab-Form-51 | `DocFab_Form_51_DK_Inheritance` |
| `PS_DocFab_Form_29` | PS-DocFab-Form-29 | `DocFab_Form_29_DK_Inheritance` |
| `PS_DocFab_Form_17` | PS-DocFab-Form-17 | `DocFab_Form_17_SE_Inheritance` |
| `PS_DocFab_Form_11` | PS-DocFab-Form-11 | `DocFab_Form_11_SE_Inheritance` |
| `PS_DocFab_Form_34` | PS-DocFab-Form-34 | `DocFab_Form_34_IE_Inheritance` |
| `PS_DocFab_Form_53` | PS-DocFab-Form-53 | `DocFab_Form_53_DK_Pension` |

#### Permission Set Group (1):
| Name | Label | Purpose |
|------|-------|---------|
| `PSG_DocFabricator_Administrator` | PSG DocFabricator Administrator | Groups all DocFab permissions for admins |

**⚠️ IMPORTANT:** Assign these Permission Sets to the relevant users BEFORE deploying Phase 5.

---

### Phase 5: Apex Classes
> **Deploy after Permissions are assigned** - This updates the business logic to use the new permission system.

| Component | Status in Production | Action | Impact |
|-----------|---------------------|--------|--------|
| `DF_DocFabricator_Utility.cls` | ✅ EXISTS | UPDATE | New methods for permission-based selection |
| `DF_DocFabricator_Utility_Test.cls` | ✅ EXISTS | UPDATE | Updated test coverage |
| `DFJ_JournalForm.cls` | ✅ EXISTS | UPDATE | New parameters, backward-compatible overloads |
| `DFJ_JournalForm_Test.cls` | ✅ EXISTS | UPDATE | Updated test coverage |

**Key Apex Changes:**
- `DF_DocFabricator_Utility.cls`:
  - New `getAccessibleOptions()` method
  - New `getFormsForRecordModel()` method
  - New `selectConfiguration()` method
  - New `normalizeIconName()` helper (auto-prefixes `utility:`)
  - All methods check Custom Permissions via `FeatureManagement.checkPermission()`
  
- `DFJ_JournalForm.cls`:
  - Extended `getJournalData_Apex()` signature with `componentRecordModelId`, `componentFormUuid`, `componentFormTypeName`
  - Updated `journalAssociatedWithAccount()` to accept `recordModelId` parameter
  - Backward-compatible overloads maintain existing functionality

---

### Phase 6: Lightning Components
> **Deploy last** - UI components that use the new permission system.

| Component | Type | Status in Production | Action |
|-----------|------|---------------------|--------|
| `dFJ_JournalFormComponent` | LWC | ✅ EXISTS | UPDATE |
| `dFJ_JournalFormOnAccount` | LWC | ❌ Does NOT exist | CREATE |
| `DFJ_JournalFormOnAccount_CMP` | Aura | ✅ EXISTS | UPDATE (backwards compat) |
| `DF_DocFabricatorForm_CMP` | Aura | ✅ EXISTS | No changes |

**LWC Changes:**
- `dFJ_JournalFormComponent`:
  - New two-tier selection UI (Record Model → Form)
  - New configurable properties: `recordModelIds`, `formNumbers`
  - Icon container styling improvements (padding increased to 10px)
  
- `dFJ_JournalFormOnAccount` (NEW):
  - Replaces functionality of old Aura component
  - Full two-tier permission-based selection
  - Order selection for Account-based journals

---

## 📁 BACKUP LOCATION

All current production metadata has been backed up to:
```
c:\Users\Mathias\DocFabJournal\production-backup\
```

**Backup Contents:**
```
production-backup/
├── package.xml                          # Manifest used for retrieval
├── classes/
│   ├── DFJ_JournalForm.cls             # ✅ Backed up
│   ├── DFJ_JournalForm_Test.cls        # ✅ Backed up
│   ├── DF_DocFabricator_Utility.cls    # ✅ Backed up
│   └── DF_DocFabricator_Utility_Test.cls # ✅ Backed up
├── lwc/
│   └── dFJ_JournalFormComponent/       # ✅ Backed up (4 files)
└── aura/
    ├── DFJ_JournalFormOnAccount_CMP/   # ✅ Backed up (9 files)
    └── DF_DocFabricatorForm_CMP/       # ✅ Backed up (9 files)
```

**Items NOT backed up (don't exist in production):**
- `DocFab_Record_Model__mdt` (Custom Metadata Type)
- `DocFab_Form__mdt` (Custom Metadata Type)
- Custom Permissions (`DocFab_Inheritance_*`)
- `dFJ_JournalFormOnAccount` LWC

---

## 🔄 ROLLBACK PLAN

### Scenario A: Rollback Apex Classes Only
If issues occur with Apex logic but Custom Metadata/Permissions are fine:

```powershell
# From project root directory
sf project deploy start --source-dir "production-backup\classes" --target-org Production --test-level RunLocalTests
```

### Scenario B: Rollback LWC Only
If issues occur with the Journal Form Component UI:

```powershell
sf project deploy start --source-dir "production-backup\lwc\dFJ_JournalFormComponent" --target-org Production
```

### Scenario C: Rollback Aura Components
If issues occur with the Account Journal Form:

```powershell
sf project deploy start --source-dir "production-backup\aura\DFJ_JournalFormOnAccount_CMP" --target-org Production
```

### Scenario D: Full Rollback (Everything)
If major issues require complete rollback:

```powershell
# Step 1: Restore all backed-up components
sf project deploy start --source-dir "production-backup\classes" --target-org Production --test-level RunLocalTests
sf project deploy start --source-dir "production-backup\lwc" --target-org Production
sf project deploy start --source-dir "production-backup\aura" --target-org Production

# Step 2: Delete new components (if they cause issues)
# Create a destructiveChanges.xml for:
# - dFJ_JournalFormOnAccount (LWC)
# - DocFab_Record_Model__mdt (Custom Metadata Type)
# - DocFab_Form__mdt (Custom Metadata Type)
# - DocFab_Inheritance_Denmark (Custom Permission)
# - DocFab_Inheritance_Ireland (Custom Permission)
# - DocFab_Inheritance_Sweden (Custom Permission)

# Step 3: Remove Permission Sets manually via Setup UI
```

### Destructive Changes Package (for deleting new components)
If you need to delete the new components, use this `destructiveChanges.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <types>
        <members>dFJ_JournalFormOnAccount</members>
        <name>LightningComponentBundle</name>
    </types>
    <types>
        <members>DocFab_Record_Model__mdt</members>
        <members>DocFab_Form__mdt</members>
        <name>CustomObject</name>
    </types>
    <types>
        <members>DocFab_Inheritance_Denmark</members>
        <members>DocFab_Inheritance_Ireland</members>
        <members>DocFab_Inheritance_Sweden</members>
        <name>CustomPermission</name>
    </types>
    <version>65.0</version>
</Package>
```

---

## 🚀 DEPLOYMENT COMMANDS (Reference)

### Phase 1: Deploy Custom Metadata Type Definitions
```powershell
# Deploy Custom Metadata Type object definitions
sf project deploy start --source-dir "force-app\main\default\objects\DocFab_Record_Model__mdt" --target-org Production
sf project deploy start --source-dir "force-app\main\default\objects\DocFab_Form__mdt" --target-org Production
```

### Phase 2: Deploy Custom Permissions
```powershell
# First, retrieve all Custom Permissions from sandbox
sf project retrieve start --metadata "CustomPermission:DocFab_Record_Model_160_DK_Inheritance" --metadata "CustomPermission:DocFab_Record_Model_218_IE_Inheritance" --metadata "CustomPermission:DocFab_Record_Model_122_SE_Inheritance" --metadata "CustomPermission:DocFab_Record_Model_63_SE_Inheritance" --metadata "CustomPermission:DocFab_Record_Model_230_DK_Pension" --metadata "CustomPermission:DocFab_Form_51_DK_Inheritance" --metadata "CustomPermission:DocFab_Form_29_DK_Inheritance" --metadata "CustomPermission:DocFab_Form_17_SE_Inheritance" --metadata "CustomPermission:DocFab_Form_11_SE_Inheritance" --metadata "CustomPermission:DocFab_Form_34_IE_Inheritance" --metadata "CustomPermission:DocFab_Form_53_DK_Pension" --target-org dfjSandbox

# Then deploy to Production
sf project deploy start --source-dir "force-app\main\default\customPermissions" --target-org Production
```

### Phase 3: Deploy Custom Metadata Records
```powershell
sf project deploy start --source-dir "force-app\main\default\customMetadata" --target-org Production
```

### Phase 4: Deploy Permission Sets
```powershell
# First, retrieve all Permission Sets from sandbox
sf project retrieve start --metadata "PermissionSet:DocFab_Record_Model_Form_Administrator" --metadata "PermissionSet:PS_DocFab_RM_160" --metadata "PermissionSet:PS_DocFab_RM_218" --metadata "PermissionSet:PS_DocFab_RM_122" --metadata "PermissionSet:PS_DocFab_RM_63" --metadata "PermissionSet:PS_DocFab_RM_230" --metadata "PermissionSet:PS_DocFab_Form_51" --metadata "PermissionSet:PS_DocFab_Form_29" --metadata "PermissionSet:PS_DocFab_Form_17" --metadata "PermissionSet:PS_DocFab_Form_11" --metadata "PermissionSet:PS_DocFab_Form_34" --metadata "PermissionSet:PS_DocFab_Form_53" --target-org dfjSandbox

# Then deploy to Production
sf project deploy start --source-dir "force-app\main\default\permissionsets" --target-org Production

# Deploy Permission Set Group
sf project retrieve start --metadata "PermissionSetGroup:PSG_DocFabricator_Administrator" --target-org dfjSandbox
sf project deploy start --source-dir "force-app\main\default\permissionsetgroups" --target-org Production
```

### Phase 4b: Assign Permission Sets to Users
> **MANUAL STEP** - Do this in Production Setup before Phase 5

### Phase 5: Deploy Apex Classes
```powershell
sf project deploy start --source-dir "force-app\main\default\classes" --target-org Production --test-level RunLocalTests
```

### Phase 6: Deploy Lightning Components
```powershell
# Deploy updated LWC
sf project deploy start --source-dir "force-app\main\default\lwc\dFJ_JournalFormComponent" --target-org Production

# Deploy new LWC for Account
sf project deploy start --source-dir "force-app\main\default\lwc\dFJ_JournalFormOnAccount" --target-org Production

# Deploy updated Aura component (backwards compatibility)
sf project deploy start --source-dir "force-app\main\default\aura\DFJ_JournalFormOnAccount_CMP" --target-org Production
```

---

## ⚠️ PRE-DEPLOYMENT CHECKLIST

- [x] Production backup completed ✅ (stored in `production-backup/`)
- [x] Permission Sets created and deployed
- [x] Custom Metadata Types deployed
- [x] Custom Permissions deployed
- [x] Custom Metadata Records deployed
- [ ] All Production tests passing (currently ~17 failing)
- [ ] Apex classes deployed (Phase 5) - BLOCKED
- [ ] Lightning components deployed (Phase 6) - WAITING
- [ ] Page Layout configurations documented (Record Model IDs, Form Numbers)

---

## 📊 PRODUCTION TEST SUMMARY

| Metric | Count |
|--------|-------|
| Total Tests | 652 |
| Passing (before our fixes) | 562 |
| Failing (before our fixes) | 90 |
| Fixed & Deployed | 73 |
| Still Failing | ~17 |

**Remaining Failing Tests (estimated):**
- 7-8 Lead conversion tests (DFJ_ConvertLeads_Test, LeadConverterClassTest)
- 5 OwnerId-related tests (need deployment of fixes)
- 3 Tests in main package (DFJ_JournalForm_Test) - references new code
- 1 SOQL 101 limit issue
- 1 Other

---

## 📝 POST-DEPLOYMENT TASKS

1. **Configure Page Layouts:**
   - Update Lead page layouts with `recordModelIds` and `formNumbers`
   - Update Account page layouts with same
   
2. **Update Custom Metadata Records:**
   - Create `DocFab_Form__mdt` records for each form
   - Verify `DocFab_Record_Model__mdt` records match sandbox

3. **Test in Production:**
   - Test with user having Denmark permission only
   - Test with user having Ireland permission only
   - Test with user having multiple permissions
   - Test with user having no permissions (should see error)

4. **Monitor:**
   - Check Debug Logs for any errors
   - Monitor for user-reported issues

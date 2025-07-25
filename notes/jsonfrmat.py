import chilkat

json = chilkat.CkJsonObject()

# Insert code here to load the above JSON into the json object.

approvalRequestId = json.IntOf("approvalRequestId")
approvalResponseId = json.IntOf("approvalResponseId")
payerNphiesId = json.stringOf("payerNphiesId")
memberCardId = json.stringOf("memberCardId")
coverageType = json.stringOf("coverageType")
relationWithSubscriber = json.stringOf("relationWithSubscriber")
paymentAmount = json.IntOf("paymentAmount")
referenceNumber = json.stringOf("referenceNumber")
insurer = json.stringOf("insurer")
claimResourceId = json.stringOf("claimResourceId")
outcome = json.stringOf("outcome")
status = json.stringOf("status")
disposition = json.stringOf("disposition")
period = json.stringOf("period")
preAuthStartDate = json.stringOf("preAuthStartDate")
preAuthEndDate = json.stringOf("preAuthEndDate")
DateOrdered = json.stringOf("preAuthorizationInfo.dateOrdered")
v_Type = json.stringOf("preAuthorizationInfo.type")
SubType = json.stringOf("preAuthorizationInfo.subType")
PayeeId = json.IntOf("preAuthorizationInfo.payeeId")
PayeeType = json.stringOf("preAuthorizationInfo.payeeType")
EligibilityOfflineDate = json.stringOf("preAuthorizationInfo.eligibilityOfflineDate")
EligibilityOfflineId = json.stringOf("preAuthorizationInfo.eligibilityOfflineId")
BillableStart = json.stringOf("preAuthorizationInfo.billableStart")
BillabelEnd = json.stringOf("preAuthorizationInfo.billabelEnd")
EligibilityResponseId = json.stringOf("preAuthorizationInfo.eligibilityResponseId")
EligibilityResponseUrl = json.stringOf("preAuthorizationInfo.eligibilityResponseUrl")
errors = json.stringOf("errors")
BeneficiaryId = json.IntOf("beneficiary.beneficiaryId")
BeneficiaryName = json.stringOf("beneficiary.beneficiaryName")
DocumentType = json.stringOf("beneficiary.documentType")
DocumentId = json.stringOf("beneficiary.documentId")
Gender = json.stringOf("beneficiary.gender")
Dob = json.stringOf("beneficiary.dob")
ContactNumber = json.stringOf("beneficiary.contactNumber")
v_Email = json.stringOf("beneficiary.email")
FirstName = json.stringOf("beneficiary.firstName")
SecondName = json.stringOf("beneficiary.secondName")
ThirdName = json.stringOf("beneficiary.thirdName")
FamilyName = json.stringOf("beneficiary.familyName")
FullName = json.stringOf("beneficiary.fullName")
Nationality = json.stringOf("beneficiary.nationality")
EmergencyPhoneNumber = json.stringOf("beneficiary.emergencyPhoneNumber")
BloodGroup = json.stringOf("beneficiary.bloodGroup")
FileId = json.stringOf("beneficiary.fileId")
EHealthId = json.stringOf("beneficiary.eHealthId")
ResidencyType = json.stringOf("beneficiary.residencyType")
MaritalStatus = json.stringOf("beneficiary.maritalStatus")
PreferredLanguage = json.stringOf("beneficiary.preferredLanguage")
AddressLine = json.stringOf("beneficiary.addressLine")
StreetLine = json.stringOf("beneficiary.streetLine")
City = json.stringOf("beneficiary.city")
State = json.stringOf("beneficiary.state")
Country = json.stringOf("beneficiary.country")
PostalCode = json.stringOf("beneficiary.postalCode")
ProviderNphiesId = json.stringOf("beneficiary.providerNphiesId")
MemberCardId = json.stringOf("beneficiary.memberCardId")
ExpiryDate = json.stringOf("beneficiary.expiryDate")
RelationWithSubscriber = json.stringOf("beneficiary.relationWithSubscriber")
CoverageType = json.stringOf("beneficiary.coverageType")
PayerNphiesId = json.stringOf("beneficiary.payerNphiesId")
PayerId = json.stringOf("beneficiary.insurancePlan.payerId")
InsurancePlanExpiryDate = json.stringOf("beneficiary.insurancePlan.expiryDate")
InsurancePlanMemberCardId = json.stringOf("beneficiary.insurancePlan.memberCardId")
PolicyNumber = json.stringOf("beneficiary.insurancePlan.policyNumber")
IsPrimary = json.BoolOf("beneficiary.insurancePlan.isPrimary")
InsurancePlanRelationWithSubscriber = json.stringOf("beneficiary.insurancePlan.relationWithSubscriber")
InsurancePlanCoverageType = json.stringOf("beneficiary.insurancePlan.coverageType")
TpaNphiesId = json.stringOf("beneficiary.insurancePlan.tpaNphiesId")
Primary = json.BoolOf("beneficiary.insurancePlan.primary")
subscriber = json.stringOf("subscriber")
accident = json.stringOf("accident")
DateWritten = json.stringOf("visionPrescription.dateWritten")
Prescriber = json.IntOf("visionPrescription.prescriber")
VisionPrescriptionId = json.stringOf("visionPrescription.visionPrescriptionId")
processNotes = json.stringOf("processNotes")
ResponseDecisionId = json.IntOf("responseDecision.responseDecisionId")
Status = json.stringOf("responseDecision.status")
claimEncounter = json.stringOf("claimEncounter")
preAuthRefNo = json.stringOf("preAuthRefNo")
preAuthDetails = json.stringOf("preAuthDetails")
providertransactionlogId = json.IntOf("providertransactionlogId")
transactionLogDate = json.stringOf("transactionLogDate")
claimRefNo = json.stringOf("claimRefNo")
claimReuseId = json.stringOf("claimReuseId")
claimReuseRelation = json.stringOf("claimReuseRelation")
transfer = json.BoolOf("transfer")
isNewBorn = json.BoolOf("isNewBorn")
requestBundleId = json.stringOf("requestBundleId")
responseBundleId = json.stringOf("responseBundleId")
cancelStatus = json.stringOf("cancelStatus")
cancelResponseReason = json.stringOf("cancelResponseReason")
cancelErrors = json.stringOf("cancelErrors")
inquiryStatus = json.stringOf("inquiryStatus")
inquiryError = json.stringOf("inquiryError")
transferAuthNumber = json.stringOf("transferAuthNumber")
transferAuthStartDate = json.stringOf("transferAuthStartDate")
transferAuthEndDate = json.stringOf("transferAuthEndDate")
transferAuthProvider = json.stringOf("transferAuthProvider")
reIssueReason = json.stringOf("reIssueReason")
tpaName = json.stringOf("tpaName")
i = 0
count_i = json.SizeOfArray("supportingInfo")
while i < count_i :
    json.put_I(i)
    i = i + 1

i = 0
count_i = json.SizeOfArray("diagnosis")
while i < count_i :
    json.put_I(i)
    sequence = json.IntOf("diagnosis[i].sequence")
    diagnosisCode = json.stringOf("diagnosis[i].diagnosisCode")
    diagnosisDescription = json.stringOf("diagnosis[i].diagnosisDescription")
    v_type = json.stringOf("diagnosis[i].type")
    onAdmission = json.stringOf("diagnosis[i].onAdmission")
    diagnosisId = json.stringOf("diagnosis[i].diagnosisId")
    i = i + 1

i = 0
count_i = json.SizeOfArray("careTeam")
while i < count_i :
    json.put_I(i)
    sequence = json.IntOf("careTeam[i].sequence")
    practitionerName = json.stringOf("careTeam[i].practitionerName")
    physicianCode = json.IntOf("careTeam[i].physicianCode")
    practitionerRole = json.stringOf("careTeam[i].practitionerRole")
    careTeamRole = json.stringOf("careTeam[i].careTeamRole")
    speciality = json.stringOf("careTeam[i].speciality")
    specialityCode = json.stringOf("careTeam[i].specialityCode")
    qualificationCode = json.stringOf("careTeam[i].qualificationCode")
    careTeamId = json.stringOf("careTeam[i].careTeamId")
    i = i + 1

i = 0
count_i = json.SizeOfArray("items")
while i < count_i :
    json.put_I(i)
    sequence = json.IntOf("items[i].sequence")
    v_type = json.stringOf("items[i].type")
    itemCode = json.stringOf("items[i].itemCode")
    itemDescription = json.stringOf("items[i].itemDescription")
    nonStandardCode = json.stringOf("items[i].nonStandardCode")
    isPackage = json.BoolOf("items[i].isPackage")
    quantity = json.IntOf("items[i].quantity")
    quantityCode = json.stringOf("items[i].quantityCode")
    unitPrice = json.IntOf("items[i].unitPrice")
    discount = json.IntOf("items[i].discount")
    factor = json.IntOf("items[i].factor")
    tax = json.IntOf("items[i].tax")
    taxPercent = json.IntOf("items[i].taxPercent")
    patientShare = json.IntOf("items[i].patientShare")
    patientSharePercent = json.IntOf("items[i].patientSharePercent")
    payerShare = json.IntOf("items[i].payerShare")
    net = json.IntOf("items[i].net")
    startDate = json.stringOf("items[i].startDate")
    endDate = json.stringOf("items[i].endDate")
    ItemDecisionId = json.IntOf("items[i].itemDecision.itemDecisionId")
    itemDecisionStatus = json.stringOf("items[i].itemDecision.status")
    ItemSequence = json.IntOf("items[i].itemDecision.itemSequence")
    PatientInvoiceNo = json.stringOf("items[i].itemDecision.patientInvoiceNo")
    NoteNo = json.stringOf("items[i].itemDecision.noteNo")
    bodySite = json.stringOf("items[i].bodySite")
    subSite = json.stringOf("items[i].subSite")
    nonStandardDesc = json.stringOf("items[i].nonStandardDesc")
    itemId = json.IntOf("items[i].itemId")
    invoiceNo = json.stringOf("items[i].invoiceNo")
    reasonCodes = json.stringOf("items[i].reasonCodes")
    j = 0
    count_j = json.SizeOfArray("items[i].supportingInfoSequence")
    while j < count_j :
        json.put_J(j)
        j = j + 1

    j = 0
    count_j = json.SizeOfArray("items[i].diagnosisSequence")
    while j < count_j :
        json.put_J(j)
        intVal = json.IntOf("items[i].diagnosisSequence[j]")
        j = j + 1

    j = 0
    count_j = json.SizeOfArray("items[i].careTeamSequence")
    while j < count_j :
        json.put_J(j)
        intVal = json.IntOf("items[i].careTeamSequence[j]")
        j = j + 1

    j = 0
    count_j = json.SizeOfArray("items[i].itemDecision.claimItemDecisionCategories")
    while j < count_j :
        json.put_J(j)
        itemDecisionCategoryId = json.IntOf("items[i].itemDecision.claimItemDecisionCategories[j].itemDecisionCategoryId")
        category = json.stringOf("items[i].itemDecision.claimItemDecisionCategories[j].category")
        categoryValue = json.stringOf("items[i].itemDecision.claimItemDecisionCategories[j].categoryValue")
        categoryCurrency = json.stringOf("items[i].itemDecision.claimItemDecisionCategories[j].categoryCurrency")
        reasonCode = json.stringOf("items[i].itemDecision.claimItemDecisionCategories[j].reasonCode")
        reasonDescription = json.stringOf("items[i].itemDecision.claimItemDecisionCategories[j].reasonDescription")
        j = j + 1

    j = 0
    count_j = json.SizeOfArray("items[i].itemDetails")
    while j < count_j :
        json.put_J(j)
        j = j + 1

    i = i + 1

i = 0
count_i = json.SizeOfArray("visionPrescription.lensSpecifications")
while i < count_i :
    json.put_I(i)
    sequence = json.IntOf("visionPrescription.lensSpecifications[i].sequence")
    product = json.stringOf("visionPrescription.lensSpecifications[i].product")
    eye = json.stringOf("visionPrescription.lensSpecifications[i].eye")
    sphere = json.stringOf("visionPrescription.lensSpecifications[i].sphere")
    cylinder = json.stringOf("visionPrescription.lensSpecifications[i].cylinder")
    axis = json.IntOf("visionPrescription.lensSpecifications[i].axis")
    prismAmount = json.stringOf("visionPrescription.lensSpecifications[i].prismAmount")
    prismBase = json.stringOf("visionPrescription.lensSpecifications[i].prismBase")
    multifocalPower = json.stringOf("visionPrescription.lensSpecifications[i].multifocalPower")
    lensPower = json.stringOf("visionPrescription.lensSpecifications[i].lensPower")
    lensBackCurve = json.stringOf("visionPrescription.lensSpecifications[i].lensBackCurve")
    lensDiameter = json.stringOf("visionPrescription.lensSpecifications[i].lensDiameter")
    lensDuration = json.stringOf("visionPrescription.lensSpecifications[i].lensDuration")
    lensDurationUnit = json.stringOf("visionPrescription.lensSpecifications[i].lensDurationUnit")
    lensColor = json.stringOf("visionPrescription.lensSpecifications[i].lensColor")
    lensBrand = json.stringOf("visionPrescription.lensSpecifications[i].lensBrand")
    lensNote = json.stringOf("visionPrescription.lensSpecifications[i].lensNote")
    lensSpecificationId = json.stringOf("visionPrescription.lensSpecifications[i].lensSpecificationId")
    i = i + 1

i = 0
count_i = json.SizeOfArray("responseDecision.claimResDecisionCategories")
while i < count_i :
    json.put_I(i)
    resDecisionCategoryId = json.IntOf("responseDecision.claimResDecisionCategories[i].resDecisionCategoryId")
    category = json.stringOf("responseDecision.claimResDecisionCategories[i].category")
    categoryValue_int = json.IntOf("responseDecision.claimResDecisionCategories[i].categoryValue")
    categoryCurrency = json.stringOf("responseDecision.claimResDecisionCategories[i].categoryCurrency")
    i = i + 1

i = 0
count_i = json.SizeOfArray("communicationResponseModel.communicationList")
while i < count_i :
    json.put_I(i)
    i = i + 1

# create_nextjs_tree.ps1
# سكريبت لإنشاء كل المجلدات والملفات لمشروع Next.js بالـ feature-based structure

$structure = @(
"src/app/[locale]/layout.tsx",
"src/app/[locale]/page.tsx",
"src/app/[locale]/error.tsx",
"src/app/[locale]/not-found.tsx",
"src/app/[locale]/admin/page.tsx",
"src/app/[locale]/auth/activate/page.tsx",
"src/app/[locale]/auth/forgot-password/page.tsx",
"src/app/[locale]/auth/login/page.tsx",
"src/app/[locale]/auth/register/page.tsx",
"src/app/[locale]/auth/reset-password/page.tsx",
"src/app/[locale]/contact/page.tsx",
"src/app/[locale]/dashboard/page.tsx",
"src/app/[locale]/payment/cancel/page.tsx",
"src/app/[locale]/payment/fail/page.tsx",
"src/app/[locale]/payment/processing/page.tsx",
"src/app/[locale]/payment/success/page.tsx",
"src/app/[locale]/prescription/create/page.tsx",
"src/app/[locale]/prescription/[id]/page.tsx",
"src/app/[locale]/prescription/[id]/edit/page.tsx",
"src/app/[locale]/profile/page.tsx",
"src/app/[locale]/unauthorized/page.tsx",
"src/app/[locale]/[slug]/page.tsx",
"src/app/providers.tsx",

"src/features/auth/components/LoginForm.tsx",
"src/features/auth/components/RegisterForm.tsx",
"src/features/auth/components/ContactForm.tsx",
"src/features/auth/api/auth.ts",
"src/features/auth/api/schema.ts",
"src/features/auth/api/types.ts",
"src/features/auth/hooks/useLogin.ts",
"src/features/auth/hooks/useRegister.ts",
"src/features/auth/utils/authHelper.ts",

"src/features/dashboard/components/PagesList.tsx",
"src/features/dashboard/components/PageDetail.tsx",
"src/features/dashboard/components/MultilingualPageEditor.tsx",
"src/features/dashboard/components/MultilingualPageDisplay.tsx",
"src/features/dashboard/api/pages.ts",
"src/features/dashboard/api/entity.ts",
"src/features/dashboard/hooks/usePages.ts",
"src/features/dashboard/hooks/useEntity.ts",
"src/features/dashboard/utils/dashboardHelper.ts",

"src/features/prescription/components/EyeTest.tsx",
"src/features/prescription/components/EyeRow.tsx",
"src/features/prescription/components/EyeExtraRow.tsx",
"src/features/prescription/components/ViewEyeTest.tsx",
"src/features/prescription/components/ViewEyeRow.tsx",
"src/features/prescription/api/prescription.ts",
"src/features/prescription/hooks/usePrescription.ts",
"src/features/prescription/utils/EyeTestValidator.ts",
"src/features/prescription/utils/handleEyeTestFormat.ts",

"src/features/payment/components/PayPalButton.tsx",
"src/features/payment/components/PricingPlans.tsx",
"src/features/payment/components/PaymentProcessingModal.tsx",
"src/features/payment/components/Payment.tsx",
"src/features/payment/api/payment.ts",
"src/features/payment/hooks/usePayment.ts",

"src/shared/components/ui/buttons/.keep",
"src/shared/components/ui/dialogs/.keep",
"src/shared/components/ui/card.tsx",
"src/shared/components/ui/ThemeToggle.tsx",
"src/shared/components/layout/Header.tsx",
"src/shared/components/layout/Footer.tsx",
"src/shared/components/layout/Navbar.tsx",
"src/shared/components/forms/DynamicFormGenerator.tsx",
"src/shared/components/forms/ControlledSelect.tsx",
"src/shared/components/forms/renderField.tsx",
"src/shared/components/search/SearchFilterForm.tsx",
"src/shared/components/search/generateSearchFieldsFromOptions.tsx",

"src/shared/hooks/useFormRequest.ts",
"src/shared/hooks/useFilteredListRequest.ts",
"src/shared/hooks/useFilterDataOptions.ts",
"src/shared/hooks/useAddItem.ts",

"src/shared/contexts/LocaleContext.tsx",
"src/shared/contexts/LanguageContext.tsx",
"src/shared/contexts/UserContext.tsx",

"src/shared/utils/cn.ts",
"src/shared/utils/toastService.ts",
"src/shared/utils/formatRelatedValue.tsx",
"src/shared/utils/generateViewFields.ts",

"src/shared/constants/url.ts",
"src/shared/constants/plans.ts",
"src/shared/constants/defaultPublicPages.ts",

"src/config/dataConfig.ts",
"src/config/formsConfig.ts",
"src/config/themes/dashboard.json",
"src/config/themes/minimal.json",
"src/config/themes/modern.json",
"src/config/themes/rtl.json",

"src/messages/ar/common.json",
"src/messages/ar/formGenerator.json",
"src/messages/en/common.json",
"src/messages/en/formGenerator.json",

"src/public/file.svg",
"src/public/globe.svg",
"src/public/logo.png",
"src/public/media/aside.png",
"src/public/media/start.jpg",

"src/styles/globals.css",
"src/styles/pages.css"
)

foreach ($path in $structure) {
    $dir = Split-Path $path
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }

    if ($path -match "\.[a-z]+$") {
        if (-not (Test-Path $path)) {
            New-Item -ItemType File -Force -Path $path | Out-Null
            Write-Host "Created: $path"
        }
    }
}


# .\create_nextjs_tree.ps1

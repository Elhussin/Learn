import secrets

# توليد مفتاح عشوائي بطول آمن (مثلاً 256-bit = 32 bytes)
signing_key = secrets.token_urlsafe(64)
print(signing_key)

#!/bin/bash
# Email parametrelerinin tanýmý
TO="ad.soyad@email.com"
SUBJECT="rsyslog Servisi Durdu"
BODY="$(hostname) üzerinde rsyslog servisi durduruldu."
 
# Rsyslog hizmetinin çalýþýp çalýþmadýðýnýn kontrolü
if systemctl is-active --quiet rsyslog; then
 echo "rsyslog çalýþýyor."
else
 echo "rsyslog çalýþmýyor. E-posta bildirimi gönderiliyor."
 
 # E-posta göndermek için kullanýlan mail komutu
 echo "$BODY" | mail -s "$SUBJECT" "$TO"
fi
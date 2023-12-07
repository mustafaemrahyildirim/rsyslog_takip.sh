#!/bin/bash
# Email parametrelerinin tan�m�
TO="ad.soyad@email.com"
SUBJECT="rsyslog Servisi Durdu"
BODY="$(hostname) �zerinde rsyslog servisi durduruldu."
 
# Rsyslog hizmetinin �al���p �al��mad���n�n kontrol�
if systemctl is-active --quiet rsyslog; then
 echo "rsyslog �al���yor."
else
 echo "rsyslog �al��m�yor. E-posta bildirimi g�nderiliyor."
 
 # E-posta g�ndermek i�in kullan�lan mail komutu
 echo "$BODY" | mail -s "$SUBJECT" "$TO"
fi
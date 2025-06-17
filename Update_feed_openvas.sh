#!/bin/bash

# Script de mise à jours OpenVAS
# Met à jour les bases de données CVE

# Arrêt des services
systemctl stop gsad gvmd ospd-openvas

# Mise à jour des feeds (VT data, SCAP data, CERT data, GVMD data)
sudo -u gvm greenbone-feed-sync

# Redémarrage des services
systemctl start ospd-openvas gvmd gsad

# Reconstruction de la base
sudo -u gvm gvmd --rebuild

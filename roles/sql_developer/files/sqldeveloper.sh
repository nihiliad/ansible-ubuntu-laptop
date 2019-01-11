#!/bin/bash
unset -v GNOME_DESKTOP_SESSION_ID
cd /opt/sqldeveloper/sqldeveloper/bin && bash sqldeveloper $*

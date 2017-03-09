#!/bin/bash
backup="~/Google\ Drive/blog-backup/ghost-content-$(date +%Y%m%d).tar.gz"
echo Creating backup $backup
tar czf ~/Google\ Drive/blog-backup/ghost-content-$(date +%Y%m%d).tar.gz content
echo Done.

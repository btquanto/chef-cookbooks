set[:amanda][:app_user] = 'amandabackup'
set[:amanda][:app_group] = 'disk'

# 'backup_locations': [
#   {
#     'hostname' : 'localhost',
#     'port'     : '1234',
#     'locations': [
#       '/etc',
#       '/var/www'
#     ]
#   }
# ]
default[:amanda][:backup_locations] = []

default[:amanda][:cron_time] = 0
default[:amanda][:home] = '/var/lib/amanda'
default[:amanda][:version] = '3.3.4'

default[:amanda][:dir][:holding_dir] = '/srv/amanda/holding'
default[:amanda][:dir][:index_dir] = '/srv/amanda/state/index'
default[:amanda][:dir][:info_dir] = '/srv/amanda/state/curinfo'
default[:amanda][:dir][:log_dir] = '/srv/amanda/state/log'
default[:amanda][:dir][:tapes_base] = '/srv/amanda/tapes'


default[:amanda][:runtapes] = 1
default[:amanda][:number_of_tapes] = node[:amanda][:runtapes] * 15
default[:amanda][:inparallel] = 10
default[:amanda][:netusage] = '80 MBps'
default[:amanda][:daily][:tape_dir] = '/srv/amanda/vtapes/daily'

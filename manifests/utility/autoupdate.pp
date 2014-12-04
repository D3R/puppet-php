define php::utility::autoupdate(
    $binary             = undef,
    $autoupdate_command = undef,
    $autoupdate_hour    = undef,
    $autoupdate_minute  = undef,
){
    if undef != $autoupdate_command {
        $hour_real = $autoupdate_hour ? {
            undef   => fqdn_rand(8),
            default => $autoupdate_hour,
        }
        $minute_real = $autoupdate_minute ? {
            undef   => fqdn_rand(59),
            default => $autoupdate_minute,
        }

        cron { "autoupdate_$name":
            ensure  => present,
            command => $autoupdate_command,
            user    => "root",
            hour    => $hour_real,
            minute  => $minute_real,
        }
    } else {
        cron { "autoupdate_$name":
            ensure => absent,
        }
    }

}

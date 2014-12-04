define php::utility(
    $destination_dir    = '/usr/local/bin',
    $download_url       = undef,
    $download_method    = 'wget',
    $mode               = '0755',
    $owner              = 'root',
    $group              = 'root',
    $autoupdate_command = undef,
    $autoupdate_hour    = undef,
    $autoupdate_minute  = undef,
){

    $destination = "$destination_dir/$name"

    php::utility::install { $name:
        destination     => $destination,
        download_method => $download_method,
        download_url    => $download_url,
        mode            => $mode,
        owner           => $owner,
        group           => $group,
    }

    php::utility::autoupdate { $name:
        binary             => $destination,
        autoupdate_command => $autoupdate_command,
        autoupdate_hour    => $autoupdate_hour,
        autoupdate_minute  => $autoupdate_minute,
        require            => Php::Utility::Install[$name],
    }
}

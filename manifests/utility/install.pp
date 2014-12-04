define php::utility::install(
    $destination        = undef,
    $download_url       = undef,
    $download_method    = 'wget',
    $mode               = '0755',
    $owner              = 'root',
    $group              = 'root',
){
    validate_string($destination)
    validate_string($download_url)
    validate_string($download_method)
    validate_string($mode)
    validate_string($owner)
    validate_string($group)

    php::utility::wget { $destination:
        download_destination => $destination,
        download_url         => $download_url,
        before               => File[$destination],
    }

    file { $destination:
        mode    => $mode,
        require => Php::Utility::Wget[$destination],
    }
}

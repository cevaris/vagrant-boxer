##
class base {
    $pacakges = [
        'vim',
        'iftop',
        'tmux'
    ]

    package { $pacakges:
        ensure => installed,
    }
}
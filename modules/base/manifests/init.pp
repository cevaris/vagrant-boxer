##
class base {
    $pacakges = [
        'vim'.
        'tmux'
    ]

    package { $pacakges:
        ensure => installed,
    }
}
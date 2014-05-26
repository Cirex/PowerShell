function Twitch
{
  Param
  (
    [Parameter(Mandatory, HelpMessage = 'http://twitch.tv/<source>')]
    [string]$Source,

    [Parameter(HelpMessage = 'Enter quality as high, medium, low, or source')]
    [ValidateSet('high', 'medium', 'low', 'source')]
    [string]$Quality = 'source'
  )

  livestreamer twitch.tv/$Source $Quality --player $ENV:MEDIA_PLAYER --player-continuous-http
}

function MLG
{
  Param
  (
    [Parameter(Mandatory, HelpMessage = 'http://tv.majorleaguegaming.com/show/<source>')]
    [string]$Source,

    [Parameter(HelpMessage = 'Enter quality as 1080p, 720p, or 480p')]
    [ValidateSet('1080p', '720p', '480p')]
    [string]$Quality = '1080p'
  )

  livestreamer http://tv.majorleaguegaming.com/show/$Source $Quality --player $ENV:MEDIA_PLAYER --player-continuous-http
}

function RTMP
{
  Param
  (
    [Parameter(Mandatory, HelpMessage = 'rtmp://<source>')]
    [string]$Source,

    [Parameter(Mandatory)]
    [string]$Quality = 'best'
  )

  livestreamer rtmp://$Source $Quality --player $ENV:MEDIA_PLAYER --player-continuous-http
}

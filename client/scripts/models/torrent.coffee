define ['serenade'], (Serenade) ->
  class Torrent extends Serenade.Model
    # listing properties that need special formatting
    @property 'quality', {
      format: (quality) ->
        switch quality
          when 'HD1080' then '1080p'
          when 'HD720' then '720p'
          else '480p'
    }

    @property 'size', {
      format: (bytes) ->
        units = ['Bytes', 'KB', 'MB', 'GB', 'TB']

        if bytes == 0 || bytes == 'undefined'
          return 'n/a'

        i = 0
        while bytes >= 1024
          i++
          bytes = bytes / 1024

        precision = if i > 2 then 1 else 0

        return "#{Number(bytes).toFixed(precision)} #{units[i]}"
    }

    @property 'status', {
      format: (status) ->
        switch status
          when 'verified' then '✓ Verified'
          else ''
    }

  return Torrent

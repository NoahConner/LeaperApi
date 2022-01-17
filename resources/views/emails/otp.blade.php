@component('mail::message')
# Leaper Way

{{ $opt['message'] }} {{ $opt['verificationCode'] }}.

Thanks,<br>
{{ config('app.name') }}
@endcomponent

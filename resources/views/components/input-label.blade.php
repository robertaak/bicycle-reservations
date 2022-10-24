@props(['value'])

<label {{ $attributes->merge(['class' => 'block font-medium text-m text-gray-900']) }}>
    {{ $value ?? $slot }}
</label>

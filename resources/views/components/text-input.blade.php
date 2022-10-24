@props(['disabled' => false])

<input {{ $disabled ? 'disabled' : '' }} {!! $attributes->merge(['class' => 'rounded-md shadow-sm border-gray-300 focus:border-[#474B8B] focus:ring focus:ring-[#474B8B] focus:ring-opacity-10']) !!}>

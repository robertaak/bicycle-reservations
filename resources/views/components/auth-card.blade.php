<div class=" min-h-screen flex justify-end items-center pt-6 sm:pt-0 pr-60 ml-20
    bg-[url('/public/images/bikes.jpg')] bg-no-repeat bg-left bg-contain bg-[length:800px]">
    <div class=" min-h-screen p-32 flex flex-col justify-center items-center mr-0 bg-[#FAF3E3]">
        <div class="mb-16">
            {{ $logo }}
        </div>
        <div class="w-full sm:max-w-md justify-center text-center text-[#1E2144] mb-8 uppercase text-2xl">
            {{ $text }}
        </div>
        <div class="w-full sm:max-w-md mt-2 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
            {{ $slot }}
        </div>
    </div>

</div>


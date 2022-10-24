<x-app-layout>
    <div class="flex justify-end mt-20 ml-20 pr-80 w-full items-center bg-[url('/public/images/bikes.jpg')] bg-no-repeat bg-left bg-contain bg-[length:800px]">
        <form method="POST" action="/rezervacijas" class="w-[40%] bg-[#FAF3E3] pr-24 pl-24 pt-20 pb-40 rounded-lg flex flex-col">
            @csrf
            <h1 class="uppercase text-[#474B8B] font-bold text-xl mb-4 text-center">Rezervē velosipēdu:</h1>
            <div class="flex flex-col gap-2">
                <label for="date" class="uppercase text-[#474B8B] font-bold">Datums:</label>
                <x-text-input class="date" type="date"
                              id="date"
                              name="date"
                              min="{{\Carbon\Carbon::today()->format('Y-m-d')}}"
                              max="{{\Carbon\Carbon::today()->addMonth()->format('Y-m-d')}}"></x-text-input>
                <x-input-error :messages="$errors->get('date')" class="mt-2b" />
            </div>

            <div class="flex flex-col gap-2 mt-4">
                <label for="bicycle_id" class="uppercase text-[#474B8B] font-bold">Pieejamie velosipēdi:</label>
                <x-select class="bicycle-list" name="bicycle_id" id="bicycle_id">
                    <option></option>
                </x-select>
                <x-input-error :messages="$errors->get('bicycle_id')" class="mt-2b" />
            </div>

            <div class="mt-6 flex justify-end">
                <x-primary-button>Rezervēt</x-primary-button>
            </div>
        </form>

        <script src="http://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
                crossorigin="anonymous">
        </script>

        <script type="text/javascript">
            $(document).ready(function(){
                $(".date").on('blur', function(){
                    var _date = $(this).val();
                    $.ajax({
                        url:"{{url('rezervacijas/')}}/pieej/"+_date,
                        dataType: 'json',
                        success:function(res){
                            var _html='';
                            $.each(res.data, function(index, row) {
                                _html+= '<option value="'+row.bicycle.id+'">'+row.bicycle.id+' - '+row.bicycleType.type+'</option>';
                            });
                            $(".bicycle-list").html(_html);
                        }
                    })
                })
            });
        </script>
    </div>
</x-app-layout>


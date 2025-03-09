<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="min-h-screen py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="flex justify-center bg-gray-100 py-10 p-14">
                <div class="container mx-auto pr-4">
                    <div
                        class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between">
                            <p class="mr-0 text-white text-lg pl-5">UPCOMING APPOINTMENTS</p>
                        </div>
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600">
                            <p>TOTAL</p>
                        </div>

                        <p class="py-4 text-3xl ml-5">5</p>
                    </div>
                </div>

                <div class="container mx-auto pr-4">
                    <div
                        class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between">
                            <p class="mr-0 text-white text-lg pl-5">PATIENTS</p>
                        </div>
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600">
                            <p>TOTAL</p>
                        </div>
                        <p class="py-4 text-3xl ml-5">107</p>
                    </div>
                </div>

                <div class="container mx-auto pr-4">
                    <div
                        class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between">
                            <p class="mr-0 text-white text-lg pl-5">RATINGS</p>
                        </div>
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600">
                            <p>TOTAL</p>
                        </div>
                        <p class="py-4 text-3xl ml-5">
                            4.5
                        </p>
                    </div>
                </div>

                <div class="container mx-auto pr-4">
                    <div
                        class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between">
                            <p class="mr-0 text-white text-lg pl-5">REVIEWS</p>
                        </div>
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600">
                            <p>TOTAL</p>
                        </div>
                        <p class="py-4 text-3xl ml-5">3</p>
                    </div>
                </div>
            </div>

            <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                <div class="row">
                    <div class="col-md-7 mt-4">
                        <div class="card">
                            <div class="card-header my-3 pb-0 px-3">
                                <h6 class="mb-0">Latest Reviews</h6>
                            </div>
                            <div class="card-body pt-4 p-3">
                                <ul class="list-group">
                                    <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-3 text-sm">Ahmad Al Mauza</h6>
                                            <div class="flex justify-between">
                                                <span class="mb-2 text-xs">Lorem ipsum dolor sit amet consectetur
                                                    adipisicing elit. Earum sunt numquam mollitia autem, ab veniam
                                                    recusandae commodi perferendis at optio error dolore praesentium
                                                    eius dolorem voluptate voluptates id quo. Quam?</span>
                                                <span class="mb-2 text-xs">12/3/2025</span>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-3 text-sm">Sahl Suhail</h6>
                                            <div class="flex justify-between">
                                                <span class="mb-2 text-xs">Lorem ipsum dolor sit amet consectetur
                                                    adipisicing elit. Earum sunt numquam mollitia autem, ab veniam
                                                    recusandae commodi perferendis at optio error dolore praesentium
                                                    eius dolorem voluptate voluptates id quo. Quam?</span>
                                                <span class="mb-2 text-xs">28/12/2024</span>
                                            </div>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-3 text-sm">Ramayanto</h6>
                                            <div class="flex justify-between">
                                                <span class="mb-2 text-xs">Lorem ipsum dolor sit amet consectetur
                                                    adipisicing elit. Earum sunt numquam mollitia autem, ab veniam
                                                    recusandae commodi perferendis at optio error dolore praesentium
                                                    eius dolorem voluptate voluptates id quo. Quam?</span>
                                                <span class="mb-2 text-xs">2/1/2025</span>
                                            </div>
                                        </div>
                                    </li>

                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>

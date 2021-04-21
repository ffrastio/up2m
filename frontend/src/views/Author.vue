<template>
    <div id="author">
        <Navbar />
        <div class="container mx-auto md:px-4 md:py-4">
            <div class="flex items-center">
                <div class="hidden md:flex items-center mr-10 ">
                    <div class="block items center mr-4">
                        <h1 class="font-semibold block text-2xl">Authors</h1>
                        <p>Total : 10</p>
                    </div>
                    <font-awesome-icon icon="users" size="2x" />
                </div>
            </div>
        </div>
        <div class="container mx-auto px-4 py-4 text-left">
            <input type="text" v-model="search" placeholder="Search Author . . ." class="border-2 px-2 py-3 rounded font-semibold">
        </div>
        <div class=" flex items-center ">
            <div class="overflow-x-auto w-full">
                <!-- Table -->
                <table
                    class="mx-auto w-full whitespace-nowrap rounded-lg bg-white divide-y divide-gray-300 overflow-hidden"
                >
                    <thead class="bg-gray-50">
                        <tr class="text-gray-600 text-left">
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                author
                            </th>
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                penelitian
                            </th>
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                pengabdian
                            </th>
                            <th
                                class="font-semibold text-sm uppercase px-6 py-4 text-center"
                            >
                                total
                            </th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200">
                        <tr>
                            <td class="px-20 py-4">
                                <div class="flex items-center space-x-3">
                                    <div class="inline-flex w-20 h-20">
                                        <img
                                            class="w-20 h-20 object-cover rounded-full"
                                            alt="User avatar"
                                            src="https://source.unsplash.com/1600x900/?woman"
                                        />
                                    </div>
                                    <div>
                                        <p class="">
                                            Jane Doe
                                        </p>
                                        <p>
                                            Teknik Informatika
                                        </p>
                                        <p
                                            class="text-gray-500 text-sm font-semibold tracking-wide"
                                        >
                                            123456789
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    10
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    10
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                20
                            </td>
                        </tr>
                        <tr>
                            <td class="px-20 py-4 justify-center items-center">
                                <div class="flex items-center space-x-3">
                                    <div class="inline-flex w-20 h-20">
                                        <img
                                            class="w-20 h-20 object-cover rounded-full"
                                            alt="User avatar"
                                            src="https://source.unsplash.com/1600x900/?man"
                                        />
                                    </div>
                                    <div>
                                        <p class="">
                                            Jane Doe
                                        </p>
                                        <p>
                                            Teknik Mesin
                                        </p>
                                        <p
                                            class="text-gray-500 text-sm font-semibold tracking-wide"
                                        >
                                            123456789
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    15
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    5
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                20
                            </td>
                        </tr>
                        <tr>
                            <td class="px-20 py-4 justify-center items-center">
                                <div class="flex items-center space-x-3">
                                    <div class="inline-flex w-20 h-20">
                                        <img
                                            class="w-20 h-20 object-cover rounded-full"
                                            alt="User avatar"
                                            src="https://source.unsplash.com/1600x900/?woman"
                                        />
                                    </div>
                                    <div>
                                        <p class="">
                                            Jane Doe
                                        </p>
                                        <p>
                                            Teknik Mesin
                                        </p>
                                        <p
                                            class="text-gray-500 text-sm font-semibold tracking-wide"
                                        >
                                            123456789
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    15
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    5
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                20
                            </td>
                        </tr>
                        <tr>
                            <td class="px-20 py-4 justify-center items-center">
                                <div class="flex items-center space-x-3">
                                    <div class="inline-flex w-20 h-20">
                                        <img
                                            class="w-20 h-20 object-cover rounded-full"
                                            alt="User avatar"
                                            src="https://source.unsplash.com/1600x900/?man"
                                        />
                                    </div>
                                    <div>
                                        <p class="">
                                            Jane Doe
                                        </p>
                                        <p>
                                            Teknik Mesin
                                        </p>
                                        <p
                                            class="text-gray-500 text-sm font-semibold tracking-wide"
                                        >
                                            123456789
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    15
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    5
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                20
                            </td>
                        </tr>
                        <tr>
                            <td class="px-20 py-4 justify-center items-center">
                                <div class="flex items-center space-x-3">
                                    <div class="inline-flex w-20 h-20">
                                        <img
                                            class="w-20 h-20 object-cover rounded-full"
                                            alt="User avatar"
                                            src="https://source.unsplash.com/1600x900/?woman"
                                        />
                                    </div>
                                    <div>
                                        <p class="">
                                            Jane Doe
                                        </p>
                                        <p>
                                            Teknik Mesin
                                        </p>
                                        <p
                                            class="text-gray-500 text-sm font-semibold tracking-wide"
                                        >
                                            123456789
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    15
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <p
                                    class="text-gray-500 text-sm font-semibold tracking-wide"
                                >
                                    5
                                </p>
                            </td>
                            <td class="px-6 py-4 text-center">
                                20
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <Footer />
    </div>
</template>

<script>
import Navbar from "@/components/layouts/Navbar.vue";
import Footer from "@/components/layouts/Footer.vue";
export default {
    name: "author",
    components: {
        Navbar,
        Footer
    },
    data() {
        return {
            search: ''
        }
    }
};
</script>

<style lang="scss" scoped></style>

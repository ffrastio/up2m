<template>
    <nav
        class="relative flex flex-wrap items-center justify-between px-2 py-3  border-b"
    >
        <div
            class="container px-4 mx-auto flex flex-wrap items-center justify-between"
        >
            <div
                class="w-full relative flex justify-between lg:w-auto  px-4 lg:static lg:block lg:justify-start"
            >
                <a href="/">
                    <img
                        src="@/assets/img/logo.png"
                        alt="Logo UP2M"
                        class="object-cover md:justify-between h-12"
                    />
                </a>
                <button
                    class="text-primary cursor-pointer text-xl leading-none px-3 py-1 border border-solid border-transparent rounded bg-transparent block lg:hidden outline-none focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
                    type="button"
                    v-on:click="toggleNavbar()"
                >
                    <font-awesome-icon icon="bars" />
                </button>
            </div>
            <div
                v-bind:class="{ hidden: !showMenu, flex: showMenu }"
                class="lg:flex lg:flex-grow items-center"
            >
                <ul
                    class="flex flex-col lg:flex-row list-none justify-end items-center"
                >
                    <li class="nav-item">
                        <router-link
                            to="/"
                            class="text-primary hover:bg-primary hover:text-white px-4 py-2 flex items-center rounded "
                            >Home</router-link
                        >
                    </li>
                    <li class="nav-item">
                        <router-link
                            :to="{ name: 'About' }"
                            class="text-primary hover:bg-primary hover:text-white px-4 py-2 flex items-center rounded "
                            >About</router-link
                        >
                    </li>
                    <li class="nav-item">
                        <router-link
                            :to="{ name: 'Author' }"
                            class="text-primary hover:bg-primary hover:text-white px-4 py-2 flex items-center rounded "
                            >Authors</router-link
                        >
                    </li>
                    <div class="dropdown inline-block relative">
                        <button
                            class="text-primary hover:bg-primary hover:text-white py-2 px-4 rounded inline-flex items-center"
                        >
                            <span class="mr-1">Sources</span>
                            <svg
                                class="fill-current h-4 w-4"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 20 20"
                            >
                                <path
                                    d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
                                />
                            </svg>
                        </button>
                        <ul
                            class="dropdown-menu absolute hidden border w-40 text-left rounded bg-white"
                        >
                            <li class="">
                                <router-link
                                    class="rounded-t text-primary hover:bg-primary hover:text-white border-b  py-2 px-4 block whitespace-no-wrap"
                                    :to="{ name: 'Penelitian' }"
                                    >Penelitian</router-link
                                >
                            </li>
                            <li class="">
                                <a
                                    class=" text-primary hover:bg-primary hover:text-white py-2 px-4 block whitespace-no-wrap"
                                    href="#"
                                    >Pengabdian Masyarakat</a
                                >
                            </li>
                        </ul>
                    </div>
                <div
                    class="border rounded-md border-primary items-center hover:bg-primary text-primary hover:text-white"
                >
                    <p class="px-4 py-2">Masuk</p>
                </div>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
export default {
    name: "navbar",
    data() {
        return {
            showMenu: false
        };
    },
    methods: {
        toggleNavbar: function() {
            this.showMenu = !this.showMenu;
        }
    }
};
</script>

<style>
.dropdown:hover .dropdown-menu {
    display: block;
}
</style>

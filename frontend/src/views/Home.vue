<template>
    <div class="home">
        <Navbar />
        <div>
            <b-jumbotron
                header="BootstrapVue"
                lead="Bootstrap v4 Components for Vue.js 2"
            >
                <p>For more information visit website</p>
                <b-button variant="primary" href="#">More Info</b-button>
            </b-jumbotron>
        </div>
        <div class="text-left px-4">
          <h1 >Data Statistik</h1>
        </div>
    </div>
</template>

<script>
// @ is an alias to /src
import Navbar from "@/components/layouts/Navbar.vue";

export default {
    name: "Home",
    components: {
        Navbar
    }
};
</script>

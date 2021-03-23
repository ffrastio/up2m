<template>
    <div class="home">
        <div class="container">
            <!-- Start Navbar -->
            <Navbar />
            <!-- End Navbar -->
            <!-- Start Jumbotron -->
            <div class="mt-4 text-left d-flex align-items-center justify-content-between">
                <div class="block">
                    <p class="title">
                        Temukan Data yang <br />
                        Diinginkan
                    </p>
                    <p>
                        UP2M Menyediakan berbagai data dan <br />
                        keperluan untuk mendukung penelitian kamu
                    </p>
                    <b-button class="btn btn-cta" href="#">Temukan!</b-button>
                </div>

                <div class="img-header">
                    <b-img
                        src="@/assets/img/content/content-1.png"
                        alt="Konten"
                        class="img-header image-cover"
                        fluid
                    />
                </div>
            </div>
            <!-- End Jumbotron -->
        </div>
        <div class="text-left title mt-4 container">
            <p>Data Statistik</p>
        </div>
        <b-row class="d-flex align-items-center container">
            <b-col class="col-6 ">
                <p class="align-items-center">
                    Data Pengabdian Internal Per Jurusan
                </p>
            </b-col>
            <b-col class="col-6">
                <p class="align-items-center">
                    Data Penelitian Internal Per Jurusan
                </p>
            </b-col>
        </b-row>
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
<style lang="scss" scoped>
.img-header {
    max-height: 350px;
}
.btn-cta {
    background-color: #008797;
    color: white;
    border: none;
}
.btn-cta:hover {
    background-color: #086670;
}
.title {
    font-weight: 500;
    font-size: 32px;
}
</style>

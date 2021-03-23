<template>
    <div>
        <b-navbar toggleable="lg">
            <b-navbar-brand href="#">
                <img
                    src="@/assets/img/logo.png"
                    alt="Logo UP2M"
                    height="50"
                    class="ima"
                />
            </b-navbar-brand>

            <b-navbar-toggle target="hamburger"></b-navbar-toggle>

            <b-collapse id="hamburger" is-nav>
                <b-navbar-nav class="mx-auto text-left">
                    <b-nav-item href="#" class="nav-item">Home</b-nav-item>
                    <b-nav-item href="#" class="nav-item">About</b-nav-item>
                    <b-nav-item href="#" class="nav-item">Author</b-nav-item>
                    <b-nav-item-dropdown text="Sources" left>
                        <b-dropdown-item href="#">Penelitian</b-dropdown-item>
                        <b-dropdown-item href="#">Pengabdian</b-dropdown-item>
                    </b-nav-item-dropdown>
                </b-navbar-nav>
            </b-collapse>
        </b-navbar>
    </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.nav-item {
    font-weight: bold;

    :hover {
        background-color: #008797;
        color: #fff !important;
    }
}
</style>

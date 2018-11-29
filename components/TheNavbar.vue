<template lang="pug">
header.nav-header
  div.container.flex.justify-between.items-center.border.border-green
    nuxt-link.logo.mt-4(to="/")
      img(src="~/assets/images/ofr-logo.svg")
    button.nav-button(@click="isActive = !isActive") MENU
    nav.nav-menu(:class="{ 'reveal-nav': isActive }")
      div.nav-link-wrapper
        nuxt-link.nav-link(to="#") Family
        nuxt-link.nav-link(to="#") Ministry
        nuxt-link.nav-link(to="#") Archives
        nuxt-link.nav-link(to="#") Contact
        nuxt-link.nav-link(to="#") Donate
</template>

<script>
export default{
  data () {
    return {
      isActive: false
    }
  }
}
</script>

<style scoped>
.logo {
  display: block;
  max-width: 200px;
}

</style>

<template lang="pug">
header.bg-white
  div.container.py-4.flex.justify-between.items-center
    nuxt-link.logo.mt-4(to="/")
      img(src="~/assets/images/ofr-logo.svg")
    nav
      nuxt-link.nav-link(to="#") Family
      nuxt-link.nav-link(to="#") Ministry
      nuxt-link.nav-link(to="#") Archives
      nuxt-link.nav-link(to="#") Contact
      nuxt-link.nav-link(to="#") Donate
</template>

<script>
export default{
}
</script>

<style scoped>
.logo {
  display: block;
  max-width: 300px;
}
</style>

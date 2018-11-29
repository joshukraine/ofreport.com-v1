<template lang="pug">
header.bg-white
  div.container.py-8.border.border-green.flex.justify-between.items-center
    nuxt-link.logo(to="/")
      img(src="~/assets/images/ofr-logo.svg")
    nav.border.border-blue
      nuxt-link.ml-6(to="#") Family
      nuxt-link.ml-6(to="#") Ministry
      nuxt-link.ml-6(to="#") Archives
      nuxt-link.ml-6(to="#") Contact
      nuxt-link.ml-6(to="#") Donate
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

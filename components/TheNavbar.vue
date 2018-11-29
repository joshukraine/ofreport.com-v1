<template lang="pug">
header.nav-header
  div.container.flex.justify-between.items-center(:class="{ 'open-nav': isActive }")
    nuxt-link.logo.mt-3(to="/")
      img(src="~/assets/images/ofr-logo.svg")
    div.relative
      button.hamburger(@click="isActive = !isActive") MENU
    nav.nav-menu.pt-8(class="sm:pt-4 lg:pt-0" :class="{ 'reveal-nav': isActive }")
      div.nav-link-wrapper
        nuxt-link.nav-link(:class="{ 'nav-link-fadein nav-link-1': isActive }" to="#") Family
        nuxt-link.nav-link(:class="{ 'nav-link-fadein nav-link-2': isActive }" to="#") Ministry
        nuxt-link.nav-link(:class="{ 'nav-link-fadein nav-link-3': isActive }" to="#") Archives
        nuxt-link.nav-link(:class="{ 'nav-link-fadein nav-link-4': isActive }" to="#") Contact
        nuxt-link.nav-link(:class="{ 'nav-link-fadein nav-link-5': isActive }" to="#") Donate
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

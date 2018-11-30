<template lang="pug">
header.nav-header.fixed.w-full.bg-white.flex.items-stretch
  div.container.flex.justify-between.items-center(
    :class="{ 'open-nav': isActive }")
    nuxt-link.logo.block.mt-3(to="/")
      img(src="~/assets/images/ofr-logo.svg")
    div.relative
      button.hamburger(@click="isActive = !isActive") MENU
    nav.nav-menu.pt-8.px-4(class="lg:pt-0" :class="{ 'reveal-nav': isActive }")
      div.nav-link-wrapper
        nuxt-link.nav-link(
          :class="{ 'nav-link-fadein nav-link-1': isActive }"
          to="#") Family
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

<style scoped>
.logo {
  max-width: 200px;
  min-width: 160px;
}

.nav-header {
  height: 80px;
}

.nav-menu {
  @apply absolute bg-ofr-blue h-screen w-full overflow-y-scroll;
  left: 100%;
  padding-bottom: 100px;
  top: 80px;
  transition: transform 0.2s ease-in-out;
}

.nav-link-wrapper {
  @apply flex flex-col;
}

.reveal-nav {
  transform: translateX(-100%);
}

.nav-link {
  @apply relative mb-8 pb-8 leading-none text-3xl text-white font-header font-bold no-underline;
  display: inline-block;
  opacity: 0;
}

.nav-link:not(:last-of-type) {
  border-bottom: 1px solid #fff;
}

.nav-link-fadein {
  opacity: 1;
  transition: opacity 0.3s ease-in-out;
}

.nav-link-1 {
  transition-delay: 0.1s;
}

.nav-link-2 {
  transition-delay: 0.14s;
}

.nav-link-3 {
  transition-delay: 0.18s;
}

.nav-link-4 {
  transition-delay: 0.22s;
}

.nav-link-5 {
  transition-delay: 0.26s;
}

/* 'sm' breakpoint */
@media (min-width: 576px) {
  .nav-menu {
    @apply px-0;
  }

  .nav-link-wrapper {
    @apply px-4;
    margin: 0 auto;
    max-width: 576px;
  }
}

/* 'md' breakpoint */
@media (min-width: 768px) {
  .nav-link-wrapper {
    max-width: 768px;
  }
}

/* 'lg' breakpoint */
@media (min-width: 992px) {
  .logo {
    max-width: 250px;
  }

  .hamburger {
    display: none;
  }

  .nav-header {
    height: 100px;
  }

  .nav-menu {
    @apply p-0 relative bg-white;
    bottom: 0;
    height: initial;
    left: initial;
    right: 0;
    top: 0;
    transform: translateX(0);
    width: initial;
  }

  .nav-link-wrapper {
    @apply p-4 flex flex-row;
  }

  .nav-link:not(:last-of-type) {
    border-bottom: none;
  }

  .nav-link {
    @apply mb-0 pb-0 text-xl ml-8 text-grey-dark;
    display: initial;
    opacity: 1;
    transition: color 150ms ease;
  }

  .nav-link:hover {
    @apply text-ofr-blue;
    transition: color 150ms ease;
  }

  .nav-link::before {
    @apply .bg-ofr-blue;
    bottom: -5px;
    content: "";
    height: 2px;
    left: 0;
    position: absolute;
    transform: scaleX(0);
    transition: all 0.2s ease-in-out 0s;
    visibility: hidden;
    width: 100%;
  }

  .nav-link:hover::before {
    transform: scaleX(1);
    visibility: visible;
  }
}
</style>

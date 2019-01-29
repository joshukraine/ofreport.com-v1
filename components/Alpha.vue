<template lang="pug">
section.alpha.bg-cover.bg-top.flex.items-center(
  v-editable="blok" class="md:bg-left lg:bg-top")
  .container.pb-10(class="sm:pb-0 md:py-32")
    .flex.justify-end.pt-24(class="sm:pt-32 md:pt-0 lg:px-10")
      .text-center.px-8(class="md:w-2/5 md:px-0")
        img(class="sm:w-4/5 md:w-full" src="~assets/images/joshua-and-kelsie.svg")
        p.text-white.font-header.mb-8(class="md:mb-12") {{ blok.subtitle }}
        p.text-white.font-header.mb-8(class="sm:text-xl md:mb-12") {{ blok.content }}
        button.btn.btn-lg.btn-blue {{ blok.call_to_action }}
</template>

<script>
export default {
  props: ['blok']
}
</script>

<template lang="pug">
nuxt-link.max-w-md.block.mx-auto(to="#")
  article.group.shadow-lg.rounded.overflow-hidden.bg-white.mb-12
    img.opacity-85.z-1(class="group-hover:opacity-100" v-if="thumbnail" :src="thumbnail")
    .preview-body.px-6.pt-2.pb-4
      h2.text-grey-darkest.mb-0(class="group-hover:text-black") {{ title }}
      p.text-grey-dark.text-sm {{ author }} &middot; {{ pubDate }}
      p.text-grey-darkest.mb-0(class="group-hover:text-black") {{ excerpt }}
</template>

<script>
export default {
  props: {
    thumbnail: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    author: {
      type: String,
      required: true
    },
    pubDate: {
      type: String,
      required: true
    },
    excerpt: {
      type: String,
      required: true
    }
  }
}
</script>

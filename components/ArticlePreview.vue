<template lang="pug">
nuxt-link.max-w-md.block.mx-auto(to="#")
  article.shadow-lg.rounded.overflow-hidden.bg-white.mb-12
    img(v-if="thumbnail" :src="thumbnail")
    .px-6.py-4
      h2 {{ title }}
      p {{ author }}
      p {{ pubDate }}
      p {{ excerpt }}
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
